//
//  OtherCaculationView.swift
//  PootToRootSwiftUI
//
//  Created by Nguyễn Trung Kiên on 13/11/25.
//

import Foundation
import SwiftUI




class CounterManager: ObservableObject {
    @Published var valueA: Int = 0
    @Published var valueB: Int = 0
    @Published var diff: Int = 0
}

struct OtherCaculationView: View {
    @StateObject var manager = CounterManager()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ScreenA(path: $path)
                .environmentObject(manager)
                .navigationDestination(for: String.self) { screen in
                    switch screen {
                    case "B":
                        ScreenB(path: $path)
                            .environmentObject(manager)
                    case "C":
                        ScreenC(path: $path)
                            .environmentObject(manager)
                    default:
                        EmptyView()
                    }
                }
        }
    }
}

// MARK: - Màn A
struct ScreenA: View {
    @EnvironmentObject var manager: CounterManager
    @Binding var path: NavigationPath
    @State private var counter: Int = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Màn A")
                .font(.largeTitle)
                
                
                HStack {
                    Button("-") { counter -= 1 }
                        .buttonStyle(.borderedProminent)
                    Text("\(counter)")
                        .font(.system(size: 50, weight: .bold))
                    Button("+") { counter += 1 }
                        .buttonStyle(.borderedProminent)
                }
            
            
            
            Button("Continue →") {
                manager.valueA = counter
                path.append("B")
            }
            .font(.title2)
            .padding()
            .background(Color.blue.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .onChange(of: manager.diff) { newDiff in
            counter = newDiff
        }
        .padding()
    }
}

// MARK: - Màn B
struct ScreenB: View {
    @EnvironmentObject var manager: CounterManager
    @Binding var path: NavigationPath
    @State private var counter: Int = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Màn B")
                .font(.largeTitle)
            
            Text("\(counter)")
                .font(.system(size: 50, weight: .bold))
            
            HStack {
                Button("-") { counter -= 1 }
                    .buttonStyle(.borderedProminent)
                Button("+") { counter += 1 }
                    .buttonStyle(.borderedProminent)
            }
            
            Button("Continue →") {
                manager.valueB = counter
                path.append("C")
            }
            .font(.title2)
            .padding()
            .background(Color.green.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .onAppear {
            counter = manager.valueA
        }
        .padding()
    }
}

// MARK: - Màn C
struct ScreenC: View {
    @EnvironmentObject var manager: CounterManager
    @Binding var path: NavigationPath
    
    var diff: Int {
        manager.valueB - manager.valueA
    }
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Màn C")
                .font(.largeTitle)
            
            if diff > 0 {
                Text("Đã tăng \(diff) đơn vị")
                    .font(.title2)
            } else if diff < 0 {
                Text("Đã giảm \(-diff) đơn vị")
                    .font(.title2)
            } else {
                Text("Không thay đổi")
                    .font(.title2)
            }
            
            Button("💾 Save") {
                manager.diff = diff
                path.removeLast(path.count) // Pop về root
            }
            .font(.title2)
            .padding()
            .background(Color.orange.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding()
    }
}

#Preview {
    OtherCaculationView()
}

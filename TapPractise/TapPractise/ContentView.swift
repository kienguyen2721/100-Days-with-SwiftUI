//
//  ContentView.swift
//  TapPractise
//
//  Created by Nguyễn Trung Kiên on 14/7/25.
//


import SwiftUI

struct ContentView: View {
    @State private var count = 0
    @State private var isHolding = false
    @State private var alpha: Double = 1.0   // 0: rất mờ , 1,0: không bị mờ
    
    var body: some View {
        VStack(spacing: 24) {
            // Label tính count
            Text("Count: \(count)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .opacity(alpha)
            
            // btn Tap
            Button("Tap") {
                count += 1
            }
            .font(.title2)
            .padding()
            .frame(maxWidth: 200)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            .contentShape(Rectangle())
            
            // btn Tap and Hold
            Button("Tap and Hold") {}
                .font(.title3)
                .padding()
                .frame(maxWidth: 200)
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(12)
                .simultaneousGesture(
                    LongPressGesture(minimumDuration: 0.1)
                        .onEnded { _ in
                            isHolding = true
                            startHoldIncrement()
                        }
                )
                .onLongPressGesture(minimumDuration: .infinity, pressing: { isPressing in
                    if !isPressing {
                        isHolding = false
                    }
                }, perform: {})
            
            // Slider điều chỉnh mờ hiện
            VStack {
                Text("Alpha")
                    .font(.headline)
                Slider(value: $alpha, in: 0...1) {
                    Text("Alpha")
                }
                .padding(.horizontal)
            }
        }
        .padding()
    }
    
    // tăng số khi giữ
    func startHoldIncrement() {
        Task {
            while isHolding {
                count += 1
                try? await Task.sleep(nanoseconds: 150_000_000) // 150ms
            }
        }
    }
}


//#Preview {
//    ContentView()
//}

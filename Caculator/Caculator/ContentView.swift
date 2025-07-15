//
//  ContentView.swift
//  Caculator
//
//  Created by Nguyễn Trung Kiên on 15/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var amount: String = ""
    @State private var percentTip: Double = 0.0

    var amountValue: Double {
        Double(amount) ?? 0
    }

    var tipAmount: Double {
        amountValue * percentTip / 100
    }

    var totalAmount: Double {
        amountValue + tipAmount
    }

    var body: some View {
        VStack(spacing: 24) {
            // textfield nhap tien
            TextField("$0.00", text: $amount)
                .keyboardType(.numberPad)
                .font(.system(size: 80, weight: .light))
                .frame(height: 170)
                .multilineTextAlignment(.trailing)
                .padding(.horizontal)
                .background(Color(.systemGray6))
                .cornerRadius(20)

            HStack(spacing: 36) {
                Spacer()
                Text("Tip(\(String(format: "%.2f", percentTip))%)")
                Text("$" + String(format: "%.2f", tipAmount))
            }
            HStack(spacing: 36) {
                Spacer()
                Text("Total:")
                Text("$" + String(format: "%.2f", totalAmount))
            }
            Slider(value: $percentTip, in: 0...100, step: 1)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

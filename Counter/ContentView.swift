//
//  ContentView.swift
//  Counter
//
//  Created by Mehmet Fışkındal on 30.07.2023.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var counter = Counter()
    @State private var textSize: CGFloat = 160.0
    
    var body: some View {
        VStack {
            Text("\(counter.numbers)")
                .font(.system(size: textSize, weight: .bold, design: .rounded))
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .onChange(of: counter.numbers) { newValue in
                    updateTextSize(newValue)
                }
            
            HStack {
                TextField("Enter a number", value: $counter.amount, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .multilineTextAlignment(.center)
                    .frame(width: 100, height: 50)
                
                Button(action: {
                    counter.addAmount(counter.amount)
                }, label: {
                    Text("Amount Add")
                })
            }
            
            HStack {
                Button(action: {
                    counter.decrement()
                }, label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                })
                Button(action: {
                    counter.increment()
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                })
                Button(action: {
                    counter.reset()
                }, label: {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                })
            }
        }
        .padding()
    }
    
    private func updateTextSize(_ number: Int) {
        withAnimation {
            if number > 999999 {
                textSize = 16.0
            } else {
                textSize = 160.0
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

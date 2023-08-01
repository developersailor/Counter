//
//  ContentView.swift
//  Counter
//
//  Created by Mehmet Fışkındal on 30.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var counter = Counter()
    var body: some View {
        VStack {
            Text("\(counter.numbers)")
                .font(.system(size: 160, weight: .bold, design: .rounded))
          HStack{
            Spacer()
            TextField("Enter a number", value: $counter.amount, formatter: NumberFormatter())
            Spacer()
          }
            
            HStack {
              Button(action: {
                counter.addAmount(counter.amount)
              }, label: {
                  Text("Amount Add")
              })
                Button(action: {
                  counter.decrement()
                }, label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                })
                Button(action: {
                  counter.increment()
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                })
                Button(action: {
                  counter.reset()
                }, label: {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                })
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

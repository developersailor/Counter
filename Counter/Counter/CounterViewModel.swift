//
//  CounterViewModel.swift
//  Counter
//
//  Created by Mehmet Fışkındal on 1.08.2023.
//

import Foundation

class Counter: ObservableObject {
  @Published var numbers = 0
  @Published var amount = 0
  func increment() {
    numbers += 1
  }
  func decrement() {
    numbers -= 1
  }
  func reset() {
    numbers = 0
  }
  func addAmount(_ amount: Int) {
    numbers += amount
  }
}

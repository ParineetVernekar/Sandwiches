//
//  SandwichStore.swift
//  Sandwiches
//
//  Created by Parineet Vernekar on 30/07/2020.
//

import Foundation

class SandwichStore: ObservableObject {
    @Published var sandwiches : [Sandwich]
    
    init(sandwiches: [Sandwich] = []){
        self.sandwiches = sandwiches
    }
}

let testStore = SandwichStore(sandwiches: testData)

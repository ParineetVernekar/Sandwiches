//
//  SandwichesApp.swift
//  Shared
//
//  Created by Parineet Vernekar on 29/07/2020.
//

import SwiftUI

@main
struct SandwichesApp: App {
    @StateObject private var store = SandwichStore()

    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}

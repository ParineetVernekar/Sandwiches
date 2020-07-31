//
//  ContentView.swift
//  Shared
//
//  Created by Parineet Vernekar on 29/07/2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: SandwichStore
    
    var body: some View {
        NavigationView{
            List{
                ForEach(store.sandwiches){sandwich in
                    SandwichCell(sandwich: sandwich)
                }
                .onMove(perform:moveSandwiches)
                .onDelete(perform:deleteSandwiches)
                HStack {
                    Spacer()
                    Text("\(store.sandwiches.count) Sandwiches")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Sandwiches")
            .toolbar{
                #if os(iOS)
                EditButton()
                #endif
                Button("Add", action: makeSandwich)
            }
            
            
            Text("Select a sandwich")
                .font(.largeTitle)
        }
        
    }
    
    func makeSandwich() {
        withAnimation {
            store.sandwiches.append(Sandwich(name: "Patty Melt",
                                             ingredientCount: 3))
        }
    }

    func moveSandwiches(from: IndexSet, to: Int) {
        withAnimation {
            store.sandwiches.move(fromOffsets: from, toOffset: to)
        }
    }

    func deleteSandwiches(offsets: IndexSet) {
        withAnimation {
            store.sandwiches.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
            .preferredColorScheme(.dark)
            
    }
}

struct SandwichCell: View {
    var sandwich: Sandwich
    var body: some View {
        NavigationLink(destination: SandwichDetail(sandwich: sandwich)){
            Image(sandwich.thumbnailName)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(sandwich.name).padding()
                Text("\(sandwich.ingredientCount) ingredients")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
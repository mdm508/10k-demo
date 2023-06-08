//
//  ContentView.swift
//  Chinese10k
//
//  Created by m on 6/6/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var words: [Word]
    
    var body: some View {
        Text("so empty")
        LazyVStack{
            ForEach(self.words){
                word in
                Text(word.traditional)
            }
        }
    }
}
//
//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}

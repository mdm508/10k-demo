//
//  Chinese10kApp.swift
//  Chinese10k
//
//  Created by m on 6/6/23.
//

import SwiftUI
import SwiftData
import SwiftCSV



@main
struct Chinese10kApp: App {
    let container: ModelContainer
    init() {
        func preLoadDataFromCSV(context: ModelContext){
            guard let csvBundleURL = Bundle.main.url(forResource: Constant.csvName , withExtension: "csv") else {
                print("Unable to locate csv in bundle")
                return
            }
            let csv = try! CSV<Named>(url: csvBundleURL, delimiter: ",", loadColumns: false)
            for row in csv.rows {
                guard let trad = row[Constant.ColumnName.traditional],
                      let simp = row[Constant.ColumnName.simplified],
                      let p = row[Constant.ColumnName.pinyin],
                      let eng = row[Constant.ColumnName.english],
                      let pos = row[Constant.ColumnName.pos],
                      let freqString = row[Constant.ColumnName.frequency],
                      let freq = Double(freqString)
                else {
                    print(row)
                    continue
                }
                
                let w = Word(traditional: trad, simplified: simp, pinyin: p, english: eng, partOfSpeech: pos, frequency: freq)
                context.insert(w)
            }
        }
            //        let configuration = ModelConfiguration(readOnly: true)
        let configuration = ModelConfiguration()
        let container = try! ModelContainer(for: [Word.self], configuration)
        preLoadDataFromCSV(context: container.mainContext)
        self.container = container
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(self.container)
    }
}
    
    

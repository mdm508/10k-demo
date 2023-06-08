//
//  Item.swift
//  Chinese10k
//
//  Created by m on 6/6/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

@Model
final class Word {
    @Attribute(.unique) var traditional: String
    var simplified: String
    var pinyin: String
    var english: String
    var partOfSpeech: String
    var frequency: Double
    
    init(traditional: String, simplified: String, pinyin: String, english: String, partOfSpeech: String, frequency: Double) {
        self.traditional = traditional
        self.simplified = simplified
        self.pinyin = pinyin
        self.english = english
        self.partOfSpeech = partOfSpeech
        self.frequency = frequency
    }
}

//
//  Game.swift
//  Millionaire
//
//  Created by Maksim Volkov on 12.04.2022.
//

import Foundation

final class Game {
    static let shared = Game()
    
    private(set) var records: [Record] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }
    
    let recordsCaretaker = RecordCaretaker()
    var gameSession: GameSession?
    var results: [Int] = []
    
    private init() {
        records = recordsCaretaker.retrieveRecords()
    }
    
    func addRecord (_ record: Record) {
        records.append(record)
    }
    
    func clearRecords() {
        records = []
    }
}

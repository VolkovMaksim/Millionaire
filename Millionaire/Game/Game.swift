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
    
    private(set) var questions: [Question] {
        didSet {
            questionsCaretaker.save(questions: self.questions)
        }
    }
    
    private(set) var randomQuestion: Bool {
        didSet {
            randomCaretaker.save(randomQuestion: self.randomQuestion)
        }
    }
    
    let recordsCaretaker = RecordCaretaker()
    let questionsCaretaker = QuestionCaretaker()
    let randomCaretaker = RandomCaretaker()
    let setting = SettingViewController()
    
    var gameSession: GameSession?
    var results: [Int] = []
    
    private init() {
        records = recordsCaretaker.retrieveRecords()
        questions = questionsCaretaker.retrieveQuestions()
        randomQuestion = randomCaretaker.retrieveRandom()
    }
    
    func addRecord (_ record: Record) {
        records.append(record)
    }
    
    func clearRecords() {
        records = []
    }
    
    func addQuestion (_ question: Question) {
        questions.append(question)
    }
    
    func changeRandom (_ random: Bool) {
        randomQuestion = random
    }
}

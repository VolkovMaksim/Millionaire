//
//  QuestionCaretaker.swift
//  Millionaire
//
//  Created by Maksim Volkov on 29.04.2022.
//

import Foundation

final class QuestionCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "question"
    
    func save(questions: [Question]) {
        do {
            let data = try self.encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveQuestions() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        
        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
}

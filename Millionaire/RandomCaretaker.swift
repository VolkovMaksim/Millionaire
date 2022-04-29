//
//  RandomCaretaker.swift
//  Millionaire
//
//  Created by Maksim Volkov on 29.04.2022.
//

import Foundation

final class RandomCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "random"
    
    func save(randomQuestion: Bool) {
        do {
            let data = try self.encoder.encode(randomQuestion)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRandom() -> Bool {
        guard let data = UserDefaults.standard.data(forKey: key) else { return false }
        
        do {
            return try self.decoder.decode(Bool.self, from: data)
        } catch {
            print(error)
            return false
        }
    }
    
}

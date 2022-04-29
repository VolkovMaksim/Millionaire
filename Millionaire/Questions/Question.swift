//
//  Question.swift
//  Millionaire
//
//  Created by Maksim Volkov on 12.04.2022.
//

import Foundation

struct Question: Codable {
    
    var questionAndRightAnswer: [String: String]
    
    var firtsAnswer: String
    var secondAnswer: String
    var thirdAnswer: String
    var fourthAnswer: String
}

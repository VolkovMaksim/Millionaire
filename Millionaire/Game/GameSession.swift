//
//  GameSession.swift
//  Millionaire
//
//  Created by Maksim Volkov on 12.04.2022.
//

import Foundation

protocol GameSessionDelegate: AnyObject {
    func didEndGame (withResult result: Int)
    func getCountOfRightAnswer() -> Int
}

class GameSession {
    // создаем ссылку на делегата
    weak var gameDelegate: GameSessionDelegate?
    
    //weak var gameVCDelegate: GameViewControllerDelegate?
    
    // перечень вопросов и ответов
    let allQuestions = DataOfQuestions.init().questions
    
    // количество правильных ответов за игровую сессию
    var rightAnswersCount = 0
    
    // количество вопросов
    let countOfQuestions = DataOfQuestions.init().questions.count
}

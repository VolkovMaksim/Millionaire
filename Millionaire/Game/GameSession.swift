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
    let setting = SettingViewController()
    
    //weak var gameVCDelegate: GameViewControllerDelegate?
    
    // перечень вопросов и ответов
    var allQuestions = DataOfQuestions.init().questions + Game.shared.questions
    
    
    // количество правильных ответов за игровую сессию
    var rightAnswersCount = 0
    
    // количество вопросов
    let countOfQuestions = AddQuestionViewController.init().getQuestion().count
    
    var randomQuestion = Game.shared.randomQuestion
}

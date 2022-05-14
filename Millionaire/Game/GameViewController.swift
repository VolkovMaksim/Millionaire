//
//  GameViewController.swift
//  Millionaire
//
//  Created by Maksim Volkov on 12.04.2022.
//

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func didEndGame (withResult result: Int)
    func getCountOfRightAnswer() -> Int
}

protocol RandomQuestionsStrategy {
    func randomQuestionON(_ random: Bool) -> [Question]
}

final class RandomStrategy: RandomQuestionsStrategy {
    func randomQuestionON(_ random: Bool) -> [Question] {
        if random == true {
            return []
        } else {
            return []
        }
    }
}

class GameViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var var1: UIButton!
    @IBOutlet weak var var2: UIButton!
    @IBOutlet weak var var3: UIButton!
    @IBOutlet weak var var4: UIButton!
    
    @IBOutlet weak var countOfQuestions: UILabel!
    
    weak var delegate: GameViewControllerDelegate?
    var gameSession = GameSession()
    var sessionQuestions = [Question]()
    
    var countOfRightAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sessionQuestions = gameSession.allQuestions
        // 4. После начала игры создайте GameSession и передайте его синглтону Game/
        Game.shared.gameSession = gameSession
        
        labelOfQuestion()
        
        // делаем делегата, чтобы ловить окончание игры
        //gameSession.gameDelegate = self
    }
    
    
    @IBAction func var1Button(_ sender: UIButton) {
        checkAnswer(yourAnswer: var1.titleLabel!.text!)
    }
    
    @IBAction func var2Button(_ sender: UIButton) {
        checkAnswer(yourAnswer: var2.titleLabel!.text!)
    }
    
    @IBAction func var3Button(_ sender: UIButton) {
        checkAnswer(yourAnswer: var3.titleLabel!.text!)
    }
    @IBAction func var4Button(_ sender: UIButton) {
        checkAnswer(yourAnswer: var4.titleLabel!.text!)
    }
    
    
    func checkAnswer(yourAnswer answer: String) {
        if answer == sessionQuestions[gameSession.rightAnswersCount].questionAndRightAnswer[questionLabel.text!] {
            print("Ваш ответ: \(answer)")
            print("Правльный ответ")
            sleep(1)
            gameSession.rightAnswersCount += 1
            print("Количество правильных ответов: \(gameSession.rightAnswersCount)")
            print("-----")
            labelOfQuestion()
        } else {
            print("Ваш ответ: \(answer)")
            print("Неправльный ответ")
            sleep(1)
            didEndGame(withResult: gameSession.rightAnswersCount)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

        
    
}

extension GameViewController: GameSessionDelegate {
    func labelOfQuestion() {
        countOfQuestions.text = "Вопрос №\(gameSession.rightAnswersCount + 1) (\(gameSession.rightAnswersCount * 100 / gameSession.allQuestions.count)%)"
//        print("--------random \(gameSession.randomQuestion)")
        //sessionQuestions = gameSession.allQuestions
        if gameSession.randomQuestion {
            sessionQuestions = gameSession.allQuestions.shuffled()
            gameSession.randomQuestion = false
            print("--------random \(gameSession.randomQuestion)")
        }
        //print(sessionQuestions)
        // если количество правильных ответов меньше количества вопросов, то задаем вопрос
        if gameSession.rightAnswersCount < gameSession.allQuestions.count {
            let questionAndAnswer = sessionQuestions[gameSession.rightAnswersCount]
            print(Array(questionAndAnswer.questionAndRightAnswer)[0].key)
            
            // Пишем вопрос
            questionLabel.text = Array(questionAndAnswer.questionAndRightAnswer)[0].key
            
            
            // Предлагаем варианты ответов, один из которых является правильным
            var1.setTitle(questionAndAnswer.firtsAnswer, for: .normal)
            var2.setTitle(questionAndAnswer.secondAnswer, for: .normal)
            var3.setTitle(questionAndAnswer.thirdAnswer, for: .normal)
            var4.setTitle(questionAndAnswer.fourthAnswer, for: .normal)
        } else {
            // если все вопросы отвечены, то заканчиваем игру и передаем результаты
            print("Вы ответили правильно на все вопросы!")
            didEndGame(withResult: gameSession.rightAnswersCount)
        }
        
    }
    
    func getCountOfRightAnswer() -> Int {
        return countOfRightAnswers
    }
    
    // окончание игры путем перехода на главный экран
    func didEndGame(withResult result: Int) {
        self.delegate?.didEndGame(withResult: result)
        let record = Record(date: Date(), score: result)
        Game.shared.addRecord(record)
        self.dismiss(animated: true, completion: nil)
    }
}

//
//  AddQuestionViewController.swift
//  Millionaire
//
//  Created by Maksim Volkov on 29.04.2022.
//

import UIKit

class AddQuestionViewController: UIViewController {

    @IBOutlet weak var addQuestion: UITextField!
    @IBOutlet weak var addRightAnswer: UITextField!
    @IBOutlet weak var addAnswerVar1: UITextField!
    @IBOutlet weak var addAnswerVar2: UITextField!
    @IBOutlet weak var addAnswerVar3: UITextField!

    var arrayQuestion = DataOfQuestions()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addQuestionButton(_ sender: UIButton) {
        if !(addQuestion.text!.isEmpty) && !(addRightAnswer.text!.isEmpty) && !(addAnswerVar1.text!.isEmpty) && !(addAnswerVar2.text!.isEmpty) && !(addAnswerVar3.text!.isEmpty) {
            Game.shared.addQuestion(Question(questionAndRightAnswer: [addQuestion.text! : addRightAnswer.text!], firtsAnswer: addRightAnswer.text!, secondAnswer: addAnswerVar1.text!, thirdAnswer: addAnswerVar2.text!, fourthAnswer: addAnswerVar3.text!))
        }
        addQuestion.text = ""
        addRightAnswer.text = ""
        addAnswerVar1.text = ""
        addAnswerVar2.text = ""
        addAnswerVar3.text = ""
    }
    
    func getQuestion() -> [Question]{
        return arrayQuestion.questions
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

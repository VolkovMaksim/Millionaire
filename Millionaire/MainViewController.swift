//
//  MainViewController.swift
//  Millionaire
//
//  Created by Maksim Volkov on 12.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var lastResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func startGame(_ sender: Any) {
        let gameSession = GameSession()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "StartGameSegue":
            guard let destinationVC = segue.destination as? GameViewController else { return }
            
            destinationVC.delegate = self
        default:
            break
        }
    }
}

extension MainViewController: GameViewControllerDelegate {
    func didEndGame(withResult result: Int) {
        lastResult.text = "Последний результат: \(result)"
    }
    
    func getCountOfRightAnswer() -> Int {
        1
    }
    
    
}

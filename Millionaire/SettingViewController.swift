//
//  SettingViewController.swift
//  Millionaire
//
//  Created by Maksim Volkov on 29.04.2022.
//

import UIKit

class SettingViewController: UIViewController {

    
    @IBOutlet weak var random: UIButton!
    
    var randomON = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        randomON = Game.shared.randomCaretaker.retrieveRandom()
        print(randomON)
        if randomON == true {
            random.backgroundColor = .green
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func randomButton(_ sender: UIButton) {
        randomON = !randomON
        if randomON == true {
            random.backgroundColor = .green
            Game.shared.changeRandom(randomON)
            print(Game.shared.randomQuestion)
        } else {
            random.backgroundColor = .white
            Game.shared.changeRandom(randomON)
            print(Game.shared.randomQuestion)
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

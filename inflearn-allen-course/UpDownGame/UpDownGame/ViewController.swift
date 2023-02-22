//
//  ViewController.swift
//  UpDownGame
//
//  Created by peppermint100 on 2023/02/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    
    var comNumber = Int.random(in: 0...10)
    var myNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
        // Do any additional setup after loading the view.
    }


    @IBAction func numberPadTapped(_ sender: UIButton) {
        guard let numberString = sender.currentTitle else { return }
        
        numberLabel.text = numberString
        myNumber = Int(numberString)!
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        comNumber = Int.random(in: 0...10)
        mainLabel.text = "선택하세요"
        numberLabel.text = ""
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        if myNumber > comNumber {
            mainLabel.text = "down"
        } else if myNumber < comNumber {
            mainLabel.text = "up"
        } else {
            mainLabel.text = "Bingo!"
        }
    }
}


//
//  ViewController.swift
//  RPSGame
//
//  Created by peppermint100 on 2023/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    
    @IBOutlet var comImageView: UIImageView!
    @IBOutlet var myImageView: UIImageView!
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var comLabel: UILabel!
    
    var myChoice = Rps.rock
    var comChoice = Rps(rawValue: Int.random(in: 0...2))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comImageView.image = UIImage(named: "ready.png")
        myImageView.image = UIImage(named: "ready.png")
        
        comLabel.text = "준비"
        myLabel.text = "준비"
    }
    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        print("rps")
        
        guard let title = sender.currentTitle else {
            return
        }
        
        switch title {
        case "가위":
            myChoice = .scissors
        case "바위":
            myChoice = .rock
        case "보":
            myChoice = .paper
        default:
            break
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        print("reset")
        comImageView.image = UIImage(named: "ready.png")
        comLabel.text = "준비"
        myImageView.image = UIImage(named: "ready.png")
        myLabel.text = "준비"
        
        mainLabel.text = "선택하세요"
        
        comChoice = Rps(rawValue: Int.random(in: 0...2))
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        print("select")
        switch comChoice {
        case .rock:
            comImageView.image = UIImage(named: "rock.png")
            comLabel.text = "바위"
        case .paper:
            comImageView.image = UIImage(named: "paper.png")
            comLabel.text = "보"
        case .scissors:
            comImageView.image = UIImage(named: "scissors.png")
            comLabel.text = "가위"
        default:
            break
        }
        
        switch myChoice {
        case .rock:
            myImageView.image = UIImage(named: "rock.png")
            myLabel.text = "바위"
        case .paper:
            myImageView.image = UIImage(named: "paper.png")
            myLabel.text = "보"
        case .scissors:
            myImageView.image = UIImage(named: "scissors.png")
            myLabel.text = "가위"
        }
        
        if comChoice == myChoice {
            mainLabel.text = "비겼다"
        } else if
            (comChoice == .rock && myChoice == .paper) ||
            (comChoice == .scissors && myChoice == .rock) ||
            (comChoice == .paper && myChoice == .scissors)
        {
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
    }
}

enum Rps: Int {
    case rock, paper, scissors
}

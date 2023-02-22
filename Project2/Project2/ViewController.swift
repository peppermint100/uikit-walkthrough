//
//  ViewController.swift
//  Project2
//
//  Created by peppermint100 on 2023/02/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var tryCount: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    var currentTry = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // CA layer는 UIColor보다 더 낮은 레이어에 있다. 따라서 UIColor를 그대로 이해하지 못해 .cgColor로 변환해주어야 한다.
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        button1.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button2.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button3.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        currentTry+=1
        tryCount.text = String(currentTry)
        
        var title: String
        var message: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            message = "Your Score Is \(score)"
            score+=1
        } else {
            title = "Wrong"
            message = "Your Score Is \(score) You selected \(countries[sender.tag])"
            score-=1
        }
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(
            UIAlertAction(
                title: "Continue",
                style: .default,
                handler: askQuestion)
        )
        
        if currentTry >= 3 {
            let ac2 = UIAlertController(
                title: "Finished",
                message: "Your Score Is \(score) Game Finisihed Score And TryCount will be reset",
                preferredStyle: .alert)
            
            ac2.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac2, animated: true)
            
            currentTry = 0
            tryCount.text = "0"
            score = 0
        }
        
        present(ac, animated: true)
    }
}


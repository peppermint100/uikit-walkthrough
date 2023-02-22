//
//  ViewController.swift
//  DiceGame
//
//  Created by peppermint100 on 2023/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstImage: UIImageView!
    @IBOutlet var secondImage: UIImageView!
    
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
                                                                                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        firstImage.image = diceArray.randomElement()
        secondImage.image = diceArray.randomElement()
    }
}


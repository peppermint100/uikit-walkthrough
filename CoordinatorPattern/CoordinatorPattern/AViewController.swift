//
//  AViewController.swift
//  CoordinatorPattern
//
//  Created by peppermint100 on 3/29/24.
//

import UIKit

class AViewController: UIViewController{
    
    var coordinator: ACoordinator?
    
    let label = UILabel()
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("to Child", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        label.text = "A"
        label.textColor = .label
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.frame = CGRect(x: 100, y: 300, width: 200, height: 80)
        button.addTarget(self, action: #selector(toChild), for: .touchUpInside)
        view.addSubview(label)
        view.addSubview(button)
        // Do any additional setup after loading the view.
    }
    
    @objc private func toChild() {
        coordinator?.toChild()
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

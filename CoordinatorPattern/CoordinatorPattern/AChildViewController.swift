//
//  AChildViewController.swift
//  CoordinatorPattern
//
//  Created by peppermint100 on 3/29/24.
//

import UIKit

class AChildViewController: UIViewController {
    
    var coordinator: AChildCoordinator?
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("back", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        view.addSubview(button)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 80)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc private func goBack() {
        coordinator?.goBack()
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

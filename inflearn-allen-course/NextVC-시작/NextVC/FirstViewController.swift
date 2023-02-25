//
//  FirstViewController.swift
//  NextVC
//
//  Created by peppermint100 on 2023/02/25.
//

import UIKit

class FirstViewController: UIViewController {
    
    var someString: String?
    
    let mainLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildUI()
        setAutoLayout()
    }
    
    func buildUI() {
        mainLabel.text = someString
        
        view.backgroundColor = .gray
        view.addSubview(mainLabel)
        view.addSubview(backButton)
    }
    
    func setAutoLayout() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            backButton.widthAnchor.constraint(equalToConstant: 140),
            backButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

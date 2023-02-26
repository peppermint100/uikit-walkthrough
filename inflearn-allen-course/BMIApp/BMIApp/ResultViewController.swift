//
//  ResultViewController.swift
//  BMIApp
//
//  Created by peppermint100 on 2023/02/26.
//

import UIKit

class ResultViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.backgroundColor = .systemBlue
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buildUI()
        setAutolayout()
    }
    
    func buildUI() {
        view.addSubview(stackView)
        view.backgroundColor = .lightGray
    }
    
    func setAutolayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            stackView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
}

//
//  ResultViewController.swift
//  BMIApp
//
//  Created by peppermint100 on 2023/02/26.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let textSize: CGFloat = 18
    
    var bmi: Double?
    var bgColor: UIColor?
    var adviseMessage: String?
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: textSize)
        label.text = "BMI 결과값"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var bmiResultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: textSize + 4)
        label.textAlignment = .center
        label.backgroundColor = bgColor!
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.text = String(bmi!)
        return label
    }()
    
    private lazy var adviceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: textSize)
        label.textAlignment = .center
        label.text = adviseMessage
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [resultLabel, bmiResultLabel, adviceLabel])
        sv.axis = .vertical
        sv.spacing = 15
        sv.distribution = .fill
        return sv
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("다시 계산하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: textSize)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buildUI()
        setAutolayout()
    }
    
    func buildUI() {
        view.addSubview(stackView)
        view.addSubview(backButton)
        view.backgroundColor = .lightGray
    }
    
    func setAutolayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bmiResultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        adviceLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            resultLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            resultLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
             
            bmiResultLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 8),
            bmiResultLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -8),
            bmiResultLabel.heightAnchor.constraint(equalToConstant: 50),
           
            adviceLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            adviceLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            backButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

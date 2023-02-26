//
//  ViewController.swift
//  BMIApp
//
//  Created by peppermint100 on 2023/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    private let textSize: CGFloat = 18
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: textSize + 3)
        label.text = "키와 몸무게를 입력해주세요"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: textSize)
        label.text = "키"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var heightTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private lazy var heightStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [heightLabel, heightTextField])
        sv.axis = .horizontal
        return sv
    }()
    
    private lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: textSize)
        label.text = "몸무게"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var weightTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .white
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private lazy var weightStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [weightLabel, weightTextField])
        sv.axis = .horizontal
        return sv
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [mainLabel, heightStackView, weightStackView])
        sv.spacing = 20
        sv.axis = .vertical
        sv.distribution = .fillEqually
        return sv
    }()
    
    private lazy var calculateBMIButton: UIButton = {
        let button = UIButton()
        button.setTitle("BMI 계산하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: textSize)
        button.addTarget(self, action: #selector(calculateBMIButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func calculateBMIButtonTapped() {
        let resultVC = ResultViewController()
        resultVC.modalPresentationStyle = .fullScreen
        present(resultVC, animated: true) {
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buildUI()
        setAutolayout()
    }
    
    func buildUI() {
        view.backgroundColor = .lightGray
        view.addSubview(stackView)
        view.addSubview(calculateBMIButton)
    }
    
    func setAutolayout() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightTextField.translatesAutoresizingMaskIntoConstraints = false
        heightStackView.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightTextField.translatesAutoresizingMaskIntoConstraints = false
        weightStackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        calculateBMIButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: 145),
            
            mainLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            mainLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            
            heightLabel.leadingAnchor.constraint(equalTo: heightStackView.leadingAnchor, constant: 0),
            heightLabel.trailingAnchor.constraint(equalTo: heightTextField.leadingAnchor, constant: 8),
            heightLabel.topAnchor.constraint(equalTo: heightStackView.topAnchor, constant: 0),
            heightLabel.bottomAnchor.constraint(equalTo: heightStackView.bottomAnchor, constant: 0),
            heightLabel.widthAnchor.constraint(equalToConstant: 80),
            
            heightTextField.trailingAnchor.constraint(equalTo: heightStackView.trailingAnchor, constant: 0),
            heightTextField.topAnchor.constraint(equalTo: heightStackView.topAnchor, constant: 0),
            heightTextField.bottomAnchor.constraint(equalTo: heightStackView.bottomAnchor, constant: 0),
            
            heightStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            heightStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            
            weightLabel.leadingAnchor.constraint(equalTo: weightStackView.leadingAnchor, constant: 0),
            weightLabel.trailingAnchor.constraint(equalTo: weightTextField.leadingAnchor, constant: 8),
            weightLabel.topAnchor.constraint(equalTo: weightStackView.topAnchor, constant: 0),
            weightLabel.bottomAnchor.constraint(equalTo: weightStackView.bottomAnchor, constant: 0),
            weightLabel.widthAnchor.constraint(equalToConstant: 80),
            
            weightTextField.trailingAnchor.constraint(equalTo: weightStackView.trailingAnchor, constant: 0),
            weightTextField.topAnchor.constraint(equalTo: weightStackView.topAnchor, constant: 0),
            weightTextField.bottomAnchor.constraint(equalTo: weightStackView.bottomAnchor, constant: 0),
            
            weightStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            weightStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            
            calculateBMIButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            calculateBMIButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            calculateBMIButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            calculateBMIButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}


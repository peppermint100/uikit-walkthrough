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
        
        guard let h = heightTextField.text, let w = weightTextField.text else { return }
        
        if h == "" || w == "" {
            mainLabel.text = "모든 칸을 다 채워주세요!"
            mainLabel.textColor = .red
            return
        }
        
        let bmi = calculateBMI(height: h, weight: w)
        let bgColor = getBgColorByBmi(bmi: bmi)
        let adviceMessage = getBmiAdviseMessage(bmi: bmi)
        
        let resultVC = ResultViewController()
        resultVC.modalPresentationStyle = .fullScreen
        resultVC.bmi = bmi
        resultVC.bgColor = bgColor
        resultVC.adviseMessage = adviceMessage
        present(resultVC, animated: true) {
            self.heightTextField.text = ""
            self.weightTextField.text = ""
        }
    }
    
    func calculateBMI(height: String, weight: String) -> Double {
        guard let h = Double(height), let w = Double(weight) else { return 0.0 }
        var bmi = w / (h*h) * 10000
        bmi = round(bmi * 10) / 10
        return bmi
    }
    
    func getBgColorByBmi(bmi: Double) -> UIColor {
        switch bmi {
        case ..<18.6:
            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            return UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
        case 25.0..<30.0:
            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30.0...:
            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            return UIColor.black
        }
    }
    
    func getBmiAdviseMessage(bmi: Double) -> String {
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        
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

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string == "" { // string == "" => 지울 때도 호출이 되기 때문에 명시
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}


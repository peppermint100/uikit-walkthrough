//
//  ViewController.swift
//  TextFieldWithDelegatePattern
//
//  Created by peppermint100 on 2023/02/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.placeholder = "이메일 입력"
        textField.clearButtonMode = .always
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return true }
        
        if currentText.count >= 5 {
            return false
        }
                
        return true
    }


    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }

}


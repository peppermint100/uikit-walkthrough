//
//  ViewController.swift
//  TimerApp
//
//  Created by peppermint100 on 2023/02/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    
    weak var timer: Timer?
    var number = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        number = Int(slider.value * 60)
        mainLabel.text = "\(number)초"
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        slider.setValue(0.5, animated: true)
        let seconds = Int(slider.value * 60)
        mainLabel.text = "\(seconds)초"
        number = seconds
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(
            timeInterval: 1.0,
            // ViewController -weak-> timer -strong-> Timer -> self(ViewController)
            // 이미 상단에서 timer를 weak으로 선언했으므로 레퍼런스 서클이 일어나지 않으므로 weak self로 선언하지 않아도 된다.
            target: self,
            selector: #selector(plusSeconds),
            userInfo: nil,
            repeats: true)
    }
    
    @objc func plusSeconds() {
        if number > 0 {
            number -= 1
            slider.value = Float(number) / Float(60)
            mainLabel.text = "\(number)초"
        } else {
            timer?.invalidate()
            number = 0
            mainLabel.text = "초를 선택하세요"
            let sound: SystemSoundID = 1016
            AudioServicesPlayAlertSound(sound)
        }
    }
}


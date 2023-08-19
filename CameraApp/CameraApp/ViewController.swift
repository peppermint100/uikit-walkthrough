//
//  ViewController.swift
//  CameraApp
//
//  Created by peppermint100 on 2023/08/19.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private let openCameraButton: UIButton = {
        let button = UIButton()
        button.setTitle("카메라 열기", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(openCameraButton)
        openCameraButton.addTarget(self, action: #selector(openCameraProcess), for: .touchUpInside)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            openCameraButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            openCameraButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            openCameraButton.widthAnchor.constraint(equalToConstant: 200),
            openCameraButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func userAllowCamera() -> Bool {
        return AVCaptureDevice.authorizationStatus(for: .video) == .authorized
    }
    
    @objc private func openCameraProcess() {
        if (userAllowCamera()) {
            openCamera()
        }
        else {
            AVCaptureDevice.requestAccess(for: .video) { [weak self] allowed in
                if (allowed) {
                    self?.openCamera()
                }
                else {
                    self?.openAppSettings()
                }
            }
        }
    }
    
    private func openCamera() {
        print("카메라를 엽니다.")
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        vc.cameraFlashMode = .on
        present(vc, animated: true, completion: nil)
    }
    
    func openAppSettings() {
        DispatchQueue.main.async {
            if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
                }
            }
        }
    }}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}


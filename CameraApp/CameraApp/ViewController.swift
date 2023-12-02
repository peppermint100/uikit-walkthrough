//
//  ViewController.swift
//  CameraApp
//
//  Created by peppermint100 on 2023/08/19.
//

import UIKit
import AVFoundation
import Vision
import VisionKit

class ViewController: UIViewController {
    
    var a: String?
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .red
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let openCameraButton: UIButton = {
        let button = UIButton()
        button.setTitle("카메라 열기", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let readTextInImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("텍스트 인식하기", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button

    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(openCameraButton)
        view.addSubview(readTextInImageButton)
        openCameraButton.addTarget(self, action: #selector(openCameraProcess), for: .touchUpInside)
        readTextInImageButton.addTarget(self, action: #selector(readTextProcess), for: .touchUpInside)
        setupConstraints()
        print(a!)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.7),
            openCameraButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            openCameraButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            openCameraButton.widthAnchor.constraint(equalToConstant: 200),
            openCameraButton.heightAnchor.constraint(equalToConstant: 50),
            readTextInImageButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            readTextInImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            readTextInImageButton.widthAnchor.constraint(equalToConstant: 200),
            readTextInImageButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK: - 텍스트 인식
    
    @objc private func readTextProcess() {
        guard let uiImage = imageView.image else {
            openCameraProcess()
            return
        }
        
        guard let cgImage = uiImage.cgImage else {
            openCameraProcess()
            return
        }
        
        let request = VNRecognizeTextRequest{ [weak self] request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else{
                return
            }
            
            let text = observations.compactMap({
                $0.topCandidates(1).first?.string
            }).joined(separator: "\n")
           
            DispatchQueue.main.async { [weak self] in
                self?.openSheetWithText(text)
            }
        }
        
        if #available(iOS 16.0, *) {
          request.revision = VNRecognizeTextRequestRevision3
          request.recognitionLanguages = ["ko-KR"]
        } else {
          request.recognitionLanguages = ["en-US"]
        }
        
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        do{
            try handler.perform([request])
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func openSheetWithText(_ text: String) {
        let vc = TextViewController(text: text)
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
        
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: - 카메라 열기
    
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            picker.dismiss(animated: true)
            return
        }
        self.imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
}


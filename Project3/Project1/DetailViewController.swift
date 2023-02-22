//
//  DetailViewController.swift
//  Project1
//
//  Created by peppermint100 on 2023/02/04.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
        // barButton Indicator Design is Type of .action
        // onClick this rightBarButton in Navigator initiate shareTapped method
        // Which is in this ViewController, which is self. that's why target is self
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    @objc func shareTapped() {
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No Image Found")
            return
        }
        
        var activityItems: [Any] = [image]
        
        if let imageName = selectedImage {
            activityItems.append(imageName)
        }
        
        let vc = UIActivityViewController(activityItems: activityItems, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem =
            navigationItem.rightBarButtonItem // for iPad
        present(vc, animated: true)
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

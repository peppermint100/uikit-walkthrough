//
//  TextViewController.swift
//  CameraApp
//
//  Created by peppermint100 on 2023/08/19.
//

import UIKit

class TextViewController: UIViewController {
    
    var text: String?
    
    init(text: String?) {
        super.init(nibName: nil, bundle: nil)
        self.text = text
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.backgroundColor = .systemBackground
        label.text = self.text
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = view.bounds
    }
}

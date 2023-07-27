//
//  ProfileViewController.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/07/20.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tableView: UITableView = {
        let tv = UITableView()
        tv.isHidden = true
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tv
    }()
    
    private var models = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        fetchProfile()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
    }
    
    private func fetchProfile() {
         APICaller.shared.getCurrentUserProfile { [weak self] result in
             DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.updateUI(with: model)
                    break
                case .failure(let error):
                    self?.failedToGetProfile()
                    print(error.localizedDescription)
                }
             }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func updateUI(with model: UserProfile) {
        tableView.isHidden = false
        models.append("Full Name: \(model.display_name)")
        models.append("External URL: \(model.external_urls)")
        models.append("ID: \(model.id)")
//        createTableHeader(with: model.images.first?.url)
        createTableHeader(with: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/220px-Image_created_with_a_mobile_phone.png")
        tableView.reloadData()
    }
    
    private func createTableHeader(with string: String?) {
        guard let urlString = string, let url = URL(string: urlString) else {
            return
        }
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.width/1.5))
        let imageSize: CGFloat = headerView.height / 2
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageSize / 2
        headerView.addSubview(imageView)
        imageView.center = headerView.center
        imageView.contentMode = .scaleAspectFit
        imageView.sd_setImage(with: url, completed: nil)
        tableView.tableHeaderView = headerView
    }
    
    private func failedToGetProfile() {
        let label = UILabel(frame: .zero)
        label.text = "Failed To load profile"
        label.sizeToFit()
        label.textColor = .black
        view.addSubview(label)
        label.center = view.center
    }
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model
        cell.selectionStyle = .none
        return cell
    }
}

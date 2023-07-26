//
//  ProfileViewController.swift
//  SpotifyClone
//
//  Created by peppermint100 on 2023/07/20.
//

import UIKit

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
        tableView.reloadData()
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Foo"
        cell.selectionStyle = .none
        return cell
    }
}

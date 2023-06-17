//
//  CompletedTodoViewController.swift
//  TodoListCodeData
//
//  Created by peppermint100 on 2023/06/15.
//

import UIKit

class CompletedTodoViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    private var models = [TodoListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTableView()
        setUpNavigationBar()
        getCompletedTodo()
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            CompletedTodoTableViewCell.self,
            forCellReuseIdentifier: CompletedTodoTableViewCell.identifier)
        tableView.frame = view.bounds
        tableView.separatorInset = UIEdgeInsets.zero
    }
    
    func getCompletedTodo() {
        models = TodoListItemManager.shared.getCompeltedTodo()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setUpNavigationBar() {
        title = "Completed"
    }
}

extension CompletedTodoViewController:
    UITableViewDelegate,
    UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CompletedTodoTableViewCell.identifier,
            for: indexPath) as! CompletedTodoTableViewCell
        cell.todo = models[indexPath.row]
        return cell
    }
}


//
//  CompletedTodoViewController.swift
//  TodoListCodeData
//
//  Created by peppermint100 on 2023/06/15.
//

import UIKit

class CompletedTodoViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
    
    func restoreTodo(todo: TodoListItem) {
        todo.isCompleted = false
        do {
            try context.save()
            getCompletedTodo()
        } catch {
            // error
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let todo = models[indexPath.row]
        
        let alert = UIAlertController(title: "Restore this todo?", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(
                title: NSLocalizedString("Cancel", comment: "Default action"),
                style: .cancel,
                handler: nil)
        let restoreAction = UIAlertAction(
                title: NSLocalizedString("OK", comment: "Default action"),
                style: .default,
                handler: { _ in
                    self.restoreTodo(todo: todo)
                })
        
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        
        alert.addAction(cancelAction)
        alert.addAction(restoreAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}


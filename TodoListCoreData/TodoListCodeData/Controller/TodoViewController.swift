//
//  ViewController.swift
//  TodoListCodeData
//
//  Created by peppermint100 on 2023/06/11.
//

import UIKit

class TodoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TodoTableViewCellDelegate {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    private var models = [TodoListItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpNavigationBar()
        getAllItems()
    }
    
    private func setUpTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(TodoTableViewCell.self, forCellReuseIdentifier: TodoTableViewCell.identifier)
    }
    
    private func setUpNavigationBar() {
        title = "Todos"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    func onTapToggleButton() {
        print("toggle button tapped")
    }
    
    @objc
    func didTapAdd() {
        let alert = UIAlertController(title: "New item", message: "Enter new item", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .default, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            self?.createItem(name: text)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func getAllItems() {
        models = TodoListItemManager.shared.getTodos()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func createItem(name: String) {
        let newItem = TodoListItem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        newItem.isCompleted = false
        
        do {
            try context.save()
            getAllItems()
        } catch {
            // error
        }
    }
    
    func deleteItem(item: TodoListItem) {
        context.delete(item)
        do {
            try context.save()
            getAllItems()
        } catch {
            // error
        }
    }
    
    func updateItem(item: TodoListItem, newName: String) {
        item.name = newName
        do {
            try context.save()
            getAllItems()
        } catch {
            // error
        }
    }
    
    func completeTodo(item: TodoListItem) {
        item.isCompleted = true
        do {
            try context.save()
            getAllItems()
        } catch {
            // error
        }
    }
    
    func onTapToggle(item: TodoListItem) {
        completeTodo(item: item)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.identifier, for: indexPath) as! TodoTableViewCell
        cell.delegate = self
        cell.todo = models[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = models[indexPath.row]
        
        let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            let alert = UIAlertController(title: "Edit item", message: "Edit new item", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = item.name
            alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else {
                return
            }
            self?.updateItem(item: item, newName: newName)
        }))
        
        self.present(alert, animated: true, completion: nil)
        }))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in
            self?.deleteItem(item: item)
        }))
        present(sheet, animated: true)
    }
    
}

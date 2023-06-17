//
//  MainTabbarViewController.swift
//  TodoListCodeData
//
//  Created by peppermint100 on 2023/06/15.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let todoVC = UINavigationController(rootViewController: TodoViewController())
        let completedTodoVC = UINavigationController(rootViewController: CompletedTodoViewController())
        
        todoVC.tabBarItem.image = UIImage(systemName: "checklist.unchecked")
        todoVC.title = "Todo"
        
        completedTodoVC.title = "Completed"
        completedTodoVC.tabBarItem.image = UIImage(systemName: "checkmark.diamond")
        
        setViewControllers([completedTodoVC, todoVC], animated: true)
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

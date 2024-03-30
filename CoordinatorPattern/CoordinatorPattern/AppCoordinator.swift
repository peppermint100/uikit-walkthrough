//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by peppermint100 on 3/29/24.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator]
    var navigationController: UINavigationController
    
    let window: UIWindow?
    
    init(_ window: UIWindow?) {
        self.parentCoordinator = nil
        self.children = []
        self.navigationController = UINavigationController()
        self.window = window
    }
    
    func start() {
        let tabBarController = UITabBarController()
        
        let aNVC = UINavigationController()
        let aCoordinator = ACoordinator(navigationController: aNVC)
        let aTabbarItem = UITabBarItem()
        aTabbarItem.title = "A"
        aNVC.tabBarItem = aTabbarItem
        
        let bNVC = UINavigationController()
        let bCoordinator = BCoordinator(navigationController: bNVC)
        let bTabbarItem = UITabBarItem()
        bTabbarItem.title = "B"
        bNVC.tabBarItem = bTabbarItem
        
        tabBarController.viewControllers = [aNVC, bNVC]
        
        aCoordinator.start()
        bCoordinator.start()
        
        children.append(aCoordinator)
        children.append(bCoordinator)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

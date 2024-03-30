//
//  Coordinator.swift
//  CoordinatorPattern
//
//  Created by peppermint100 on 3/29/24.
//

import UIKit

protocol CoordinatorEvent {
}

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    func start()
}

extension Coordinator {
    /// Removing a coordinator inside a children. This call is important to prevent memory leak.
    /// - Parameter coordinator: Coordinator that finished.
    func childDidFinish(_ coordinator : Coordinator){
        // Call this if a coordinator is done.
        for (index, child) in children.enumerated() {
            if child === coordinator {
                children.remove(at: index)
                break
            }
        }
    }
}

class ACoordinator : Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {// Setup initial VC here!}
        let aVC = AViewController()
        aVC.coordinator = self
        navigationController.viewControllers = [aVC]
    }
    
    func toChild() {
        let aChildCoordinator = AChildCoordinator(navigationController: navigationController)
        aChildCoordinator.parentCoordinator = self
        children.append(aChildCoordinator)
        aChildCoordinator.start()
    }
}

class AChildCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AChildViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goBack() {
        parentCoordinator?.childDidFinish(self)
        navigationController.popViewController(animated: true)
    }
}

class BCoordinator : Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {// Setup initial VC here!}
        let bVC = BViewController()
        navigationController.viewControllers = [bVC]
    }
}

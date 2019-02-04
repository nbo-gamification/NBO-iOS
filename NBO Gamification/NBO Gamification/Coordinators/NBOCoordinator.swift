//
//  NBOCoordinator.swift
//  NBO Gamification
//
//  Created by facundop on 17/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

protocol CoordinatorDelegate: class {
    func coordinatorDidFinish(_ coordinator: NBOCoordinator, completion: (() -> Void)?)
}

class NBOCoordinator: NSObject {
    
    weak var coordinatorDelegate: CoordinatorDelegate?
    internal weak var parentCoordinator: NBOCoordinator?
    internal let presentingViewController: UIViewController
    internal var childCoordinators = [NBOCoordinator]()
    internal var viewController: UIViewController?
    internal var presentAnimated = true
    internal var presentModal = false
 
    // MARK: Coordinator Lifecycle
    
    init(withViewController viewController: UIViewController) {
        presentingViewController = viewController
        super.init()
        
        print("init \(self)")
    }
    
    deinit {
        childCoordinators.forEach {
            parentCoordinator?.childCoordinators.append($0)
            $0.parentCoordinator = parentCoordinator
        }
        
        print("de-init \(self)")
    }
    
    func pushViewController(_ viewController: UIViewController, presentModal: Bool = false) {
        switch presentingViewController {
        case let nav as UINavigationController where !presentModal:
            nav.pushViewController(viewController, animated: !nav.viewControllers.isEmpty && nav.view.superview != nil)
        case let nav as UINavigationController where presentModal:
            // Option to show navControllers as modals
            nav.present(viewController, animated: presentAnimated)
        default:
            presentingViewController.present(viewController, animated: presentAnimated, completion: nil)
        }
    }
    
    func popViewController(_ viewController: UIViewController?, fromPresentingViewController presenting: UIViewController?, animated: Bool = true, completion: (() -> Void)? = nil) {
        switch presenting ?? presentingViewController {
        case let nav as UINavigationController:
            if nav.viewControllers.first == viewController && presentingViewController.presentedViewController != nil {
                presentingViewController.dismiss(animated: true, completion: completion)
            } else {
                if let viewController = viewController,
                    let index = nav.viewControllers.index(of: viewController),
                    index > 0 {
                    nav.popToViewController(nav.viewControllers[index - 1], animated: animated)
                } else if nav.presentedViewController == viewController {
                    nav.dismiss(animated: true, completion: completion)
                } else if viewController != nil {
                    CATransaction.begin()
                    CATransaction.setCompletionBlock(completion)
                    nav.popViewController(animated: true)
                    CATransaction.commit()
                }
            }
        case _ as UIPageViewController:
            break
        default:
            (viewController ?? presenting ?? presentingViewController).dismiss(animated: true, completion: completion)
        }
    }
    
    func popViewController(_ viewController: UIViewController?, completion: (() -> Void)? = nil) {
        popViewController(viewController, fromPresentingViewController: nil, completion: completion)
    }
    
    func pushCoordinator(_ coordinator: NBOCoordinator) {
        childCoordinators.append(coordinator)
        if coordinator.parentCoordinator == nil {
            coordinator.parentCoordinator = self
        }
        coordinator.start()
    }
    
    func popCoordinator(_ coordinator: NBOCoordinator, animated: Bool = true, completion: (() -> Void)? = nil) {
        for child in coordinator.childCoordinators {
            popCoordinator(child)
        }
        popViewController(coordinator.viewController, fromPresentingViewController: coordinator.presentingViewController, animated: animated, completion: completion)
        assert(coordinator.parentCoordinator != nil, "Can't pop coordinator \(coordinator) with no parent!")
        let parent = coordinator.parentCoordinator ?? self
        if let index = parent.childCoordinators.index(of: coordinator) {
            parent.childCoordinators.remove(at: index)
        }
    }
    
    func start() {
        guard let viewController = viewController else { print("trying to push \(self) with no view controller!"); return }
        if viewController.parent == nil {
            pushViewController(viewController, presentModal: presentModal)
        }
    }
}

extension NBOCoordinator: CoordinatorDelegate {
    func coordinatorDidFinish(_ coordinator: NBOCoordinator, completion: (() -> Void)? = nil) {
        popCoordinator(coordinator, completion: completion)
    }
}

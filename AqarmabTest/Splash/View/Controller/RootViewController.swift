//
//  RootViewController.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import UIKit

class RootViewController: UIViewController {
    
    // MARK: - Proerties
    var current: UIViewController
    
    
    // MARK: - Init
    init() {
        self.current = UIStoryboard(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        self.current = UIStoryboard(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addCurrentView()
    }
    
}


// MARK: - Private Functions
extension RootViewController {
    
    // MARK: Add Current View
    private func addCurrentView() {
        addChild(current)
        current.view.frame = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
    }
    
    
    // MARK: Animate The View Controller When Dismiss
    private func animateDismissTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParent: nil)
        addChild(new)
        transition(from: current, to: new, duration: 0.3, options: [], animations: {
            new.view.frame = self.view.bounds
        }) { completed in
            self.current.removeFromParent()
            new.didMove(toParent: self)
            self.current = new
            completion?()
        }
    }
    
    
    // MARK: Switch To Popular Screen
    func switchToPopularScreen() {
        let welcomeViewController = UIStoryboard(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController")
        let welcomeNavigationController = TransparentNavigation(rootViewController: welcomeViewController)
        animateDismissTransition(to: welcomeNavigationController)
    }
    
}

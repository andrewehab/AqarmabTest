//
//  RootViewController.swift
//  Fatorty
//
//  Created by Esraa Ragab on 7/11/19.
//  Copyright © 2019 Esraa Mohamed Ragab. All rights reserved.
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
    
    
    // MARK: Switch To Welcome Screen
    func switchToWelcomeScreen() {
        if let welcomeViewController = UIStoryboard(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController {
            let welcomeNavigationController = TransparentNavigation(rootViewController: welcomeViewController)
            animateDismissTransition(to: welcomeNavigationController)
        }
    }
    
    
    // MARK: Switch To Sign In
    func switchToSignIn() {
        if let signInViewController = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController {
            let signInNavigationController = TransparentNavigation(rootViewController: signInViewController)
            animateDismissTransition(to: signInNavigationController)
        }
    }
    
    
    // MARK: Switch To Sign Up
    func switchToSignUp() {
        if let signUpViewController = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController {
            let signUpNavigationController = TransparentNavigation(rootViewController: signUpViewController)
            animateDismissTransition(to: signUpNavigationController)
        }
    }
    
    
    // MARK: Switch To Complete Profile
    func switchToCompleteProfile() {
        if let completeProfileViewController = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "CompleteProfileViewController") as? CompleteProfileViewController {
            let completeProfileNavigationController = TransparentNavigation(rootViewController: completeProfileViewController)
            animateDismissTransition(to: completeProfileNavigationController)
        }
    }
    
    
    // MARK: Switch To Home Screen
    func switchToHome() {
        if let tabViewController = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController {
            let tabScreen = TransparentNavigation(rootViewController: tabViewController)
            animateDismissTransition(to: tabScreen)
        }
    }
    
    
    // MARK: Switch To Add Schedule
    func switchToMyAppointments() {
        if let tabViewController = UIStoryboard(name: "TabBar", bundle: nil).instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController {
            tabViewController.tabBarViewModel.selectedTabBehaviorRelay.accept(.Appointment)
            let tabScreen = TransparentNavigation(rootViewController: tabViewController)
            animateDismissTransition(to: tabScreen)
        }
    }
    
    
    // MARK: Switch To Profile
    func switchToProfile() {
        if let profileViewController = UIStoryboard(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController {
            let profileNavigationController = TransparentNavigation(rootViewController: profileViewController)
            animateDismissTransition(to: profileNavigationController)
        }
    }
    
}

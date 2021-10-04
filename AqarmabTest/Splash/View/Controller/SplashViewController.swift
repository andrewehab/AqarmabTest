//
//  SplashViewController.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import UIKit
import RxSwift

class SplashViewController: UIViewController {
    
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigateToPopularScreen()
    }
    
}

// MARK: - Private Functions
extension SplashViewController {
    
    // MARK: Navigate To Popular Screen
    private func navigateToPopularScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            SceneDelegate.shared?.rootViewController?.switchToPopularScreen()
        }
    }
    
}



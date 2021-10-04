//
//  TransparentNavigation.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import UIKit

class TransparentNavigation: UINavigationController {
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        trasparentNavigationBar()
    }
    
}


// MARK: - Private Functions
extension TransparentNavigation {
    
    // MARK:  Transparent Navigation Bar
    private func trasparentNavigationBar() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }
    
}

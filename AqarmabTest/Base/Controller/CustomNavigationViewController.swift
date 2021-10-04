//
//  CustomNavigationViewController.swift
//  AqarmabTest
//
//  Created by AnDy on 04/10/2021.
//

import UIKit

class CustomNavigationViewController: UIViewController {
    
    //MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


// MARK: - General Functions
extension CustomNavigationViewController {
    
    // MARK: Set Navigation Large Title
    func setNavigationLargeTitle(title: String) {
        tabBarController?.navigationController?.navigationBar.prefersLargeTitles = true
        tabBarController?.navigationItem.largeTitleDisplayMode = .always
        tabBarController?.navigationController?.navigationBar.sizeToFit()
        tabBarController?.title = title
    }
    
    
    // MARK: Set Navigation Normal Title
    func setNavigationNormalTitle(title: String) {
        tabBarController?.navigationItem.largeTitleDisplayMode = .never
        tabBarController?.navigationController?.navigationBar.sizeToFit()
        tabBarController?.title = title
    }
    
}

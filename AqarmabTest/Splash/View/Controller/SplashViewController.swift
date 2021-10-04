//
//  SplashViewController.swift
//  TestRxSwift
//
//  Created by AnDy on 24/07/2021.
//

import UIKit
import Firebase
import RxSwift

class SplashViewController: UIViewController {
    
    // MARK: - Proerties
    let splashViewModel = SplashViewModel()
    let disposeBag = DisposeBag()

    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        subscibeOnSelectedUserStatus()
        subscibeOnFirstTimeUsingApp()
        checkUserStatus()
        onlineActiveUser()
    }
    
}


// MARK: - Private Functions
extension SplashViewController {
    
    // MARK: Online Active User
    private func onlineActiveUser() {
//        OnlineOfflineService.updateOnlineStatus(status: true) { _ in }
    }
    
    
    // MARK: Check User Status
    private func checkUserStatus() {
        DispatchQueue.main.asyncAfter(deadline:  DispatchTime.now() + 2) {
            self.splashViewModel.checkUserFirstTimeUsingApp()
        }
    }
    
    
    // MARK: Subscibe On First Time Using App
    private func subscibeOnFirstTimeUsingApp() {
        splashViewModel.firstTimeUsingAppBehaviorRelay.subscribe(onNext: { firstTime in
            SceneDelegate.shared?.rootViewController?.switchToWelcomeScreen()
        }).disposed(by: disposeBag)
    }
    
    
    // MARK: Subscibe On Selected User Status
    private func subscibeOnSelectedUserStatus() {
        splashViewModel.userStatusBehaviorRelay.subscribe(onNext: { [weak self] userStatus in
            guard let self = self else { return }
            self.navigateUserAccordingToItsStatus(userStatus: userStatus)
        }).disposed(by: disposeBag)
    }
    
    
    // MARK: Navigate User According To Its Status
    private func navigateUserAccordingToItsStatus(userStatus: SplashViewModel.UserStatus) {
        
        switch userStatus {
        
        case .NewUser:
            SceneDelegate.shared?.rootViewController?.switchToSignIn()
            
        case .OldUserWithCompletedProfile:
            SceneDelegate.shared?.rootViewController?.switchToHome()
            
        case .OldUserWithNoCompleteProfile:
            SceneDelegate.shared?.rootViewController?.switchToCompleteProfile()
            
        }
    }
    
}




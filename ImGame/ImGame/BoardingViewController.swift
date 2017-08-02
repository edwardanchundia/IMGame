//
//  BoardingViewController.swift
//  ImGame
//
//  Created by Edward Anchundia on 8/1/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit
import FirebaseAuth

class BoardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        UIView.animate(withDuration: 2.0, delay: 0.0, options: .curveEaseInOut, animations: {
//            self.view.alpha = 1.0
//        }, completion: nil)
        view.backgroundColor = UIColor(red:0.99, green:0.93, blue:0.13, alpha:1.0)
        perform(#selector(checkSignIn), with: nil, afterDelay: 2)
    }
    
    func checkSignIn() {
//        FIRAuth.auth()?.addStateDidChangeListener({ (auth, user) in
//            if user != nil {
//                let navigationController = UINavigationController(rootViewController: DashboardViewController())
//                self.present(navigationController, animated: true, completion: nil)
//            } else {
//                let signinViewController = SignInViewController()
//                self.present(signinViewController, animated: true, completion: nil)
//            }
//        })
        if FIRAuth.auth()?.currentUser != nil {
            let navigationController = UINavigationController(rootViewController: DashboardViewController())
            self.present(navigationController, animated: true, completion: nil)
        } else {
            let signinViewController = SignInViewController()
            self.present(signinViewController, animated: true, completion: nil)
        }
    }

}

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

    var boardingView: BoardingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardingView = BoardingView(frame: CGRect.zero)
        self.view.addSubview(boardingView)
        
        view.backgroundColor = .white
        
        boardingView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)

        UIView.animate(withDuration: 4.0, delay: 0.0, options: .curveEaseInOut, animations: {
            self.boardingView.logo.alpha = 1.0
        }, completion: nil)
        
        //view.backgroundColor = UIColor(red:0.99, green:0.93, blue:0.13, alpha:1.0)
        perform(#selector(checkSignIn), with: nil, afterDelay: 4)
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
            let navigationController = UINavigationController(rootViewController: MainDashboardViewController())
            self.present(navigationController, animated: true, completion: nil)
        } else {
            print("No Current User")
            let signinViewController = SignInViewController()
            self.present(signinViewController, animated: true, completion: nil)
        }
    }

}

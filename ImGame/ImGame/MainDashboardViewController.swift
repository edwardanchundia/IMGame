//
//  MainDashboardViewController.swift
//  ImGame
//
//  Created by Edward Anchundia on 8/2/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class MainDashboardViewController: UIViewController {

    var mainDashViews: MainDashboardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainDashViews = MainDashboardView(frame: CGRect.zero)
        self.view.addSubview(mainDashViews)
        mainDashViews.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        
        view.backgroundColor = .white
        
        checkIfUserIsLoggedIn()
        
        mainDashViews.matchButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        mainDashViews.messagingButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        mainDashViews.localEvents.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = true
    }
    
    func buttonPressed(button: UIButton) {
        if button.tag == 0 {
            let gameDashboardVC  = UINavigationController(rootViewController: DashboardViewController())
//            navigationController?.pushViewController(gameDashboardVC, animated: true)
            present(gameDashboardVC, animated: true, completion: nil)
        } else if button.tag == 1 {
            let messagingVC = MessagesController()
            navigationController?.pushViewController(messagingVC, animated: true)
        } else if button.tag == 2 {
            let localEventsVC = LocalEventsViewController()
            navigationController?.pushViewController(localEventsVC, animated: true)
        }
    }
    
    func checkIfUserIsLoggedIn() {
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            fetchUserAndSetupNavBarTitle()
        }
    }
    
    func fetchUserAndSetupNavBarTitle() {
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {
            //for some reason uid = nil
            return
        }
        
        FIRDatabase.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                //                self.navigationItem.title = dictionary["name"] as? String
                
                let user = User(dictionary: dictionary)
                self.setupNavBarWithUser(user)
            }
            
        }, withCancel: nil)
    }
    
    func handleLogout() {
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        //        let loginController = LoginController()
        //        loginController.messagesController = self
        //        present(loginController, animated: true, completion: nil)
    }
    
    func setupNavBarWithUser(_ user: User) {
        if let profileImageUrl = user.profileImageUrl {
            mainDashViews.profileImage.contentMode = .scaleAspectFill
            mainDashViews.profileImage.layer.cornerRadius = 100
            mainDashViews.profileImage.clipsToBounds = true
            mainDashViews.profileImage.image = UIImage(named: "brandin")
            //mainDashViews.profileImage.loadImageUsingCacheWithUrlString(profileImageUrl)
        }
        
        if let name = user.name {
            mainDashViews.nameLabel.text = name
        }
    }

}

//
//  SignInViewController.swift
//  ImGame
//
//  Created by Edward Anchundia on 7/31/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit
import PureLayout
import GoogleSignIn
import FirebaseAuth

class SignInViewController: UIViewController, GIDSignInUIDelegate {
    
    var signIn: SignInView!
    
    var messagesController: MessagesController?

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        
        signIn = SignInView(frame: CGRect.zero)
        self.view.addSubview(signIn)
        
        view.backgroundColor = .white
        signIn.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        
        signIn.loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButtonPressed() {
        do {
            print("Logged out")
            try FIRAuth.auth()?.signOut()
        }
        catch {
            print("something")
        }
        
        
        guard let email = signIn.emailTextField.text, let password = signIn.passwordTextField.text else {
            print("Form is not valid")
            return
        }
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
            
            //successfully logged in our user
            
            self.messagesController?.fetchUserAndSetupNavBarTitle()
            
            self.dismiss(animated: true, completion: nil)
            
            let navigationController = UINavigationController(rootViewController: DashboardViewController())
            self.present(navigationController, animated: true, completion: nil)
            
        })
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let err = error {
            print("Failed to log into Google: ", err)
            return
        }
        
        print("Successfully logged into Google", user)
        
        self.dismiss(animated: true, completion: nil)
        
//        guard let idToken = user.authentication.idToken else { return }
//        guard let accessToken = user.authentication.accessToken else { return }
//        let credentials = FIRGoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
//        
//        FIRAuth.auth()?.signIn(with: credentials, completion: { (user, error) in
//            if let err = error {
//                print("Failed to create a Firebase User with Google account: ", err)
//                return
//            }
        
//            guard let uid = user?.uid else { return }
//            print("Successfully logged into Firebase with Google", uid)
//        })
        guard let authentication = user.authentication else { return }
        let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if let error = error {
                print(error)
                return
            }
            
            print("Signed In")
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

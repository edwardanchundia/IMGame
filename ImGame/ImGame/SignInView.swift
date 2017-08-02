//
//  SignInView.swift
//  ImGame
//
//  Created by Edward Anchundia on 7/31/17.
//  Copyright © 2017 Edward Anchundia. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit

class SignInView: UIView, FBSDKLoginButtonDelegate {
    
    var shouldSetupConstraints = true
    
    var screenSize = UIScreen.main.bounds

    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        GIDSignIn.sharedInstance().uiDelegate = self
        addSubview(googleSignInButton)
        addSubview(facebookSignInButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupGoogleButtonConstraints() {
        googleSignInButton.autoPinEdge(toSuperviewEdge: .top, withInset: screenSize.height / 3)
        googleSignInButton.autoPinEdge(toSuperviewEdge: .left, withInset: 25)
        googleSignInButton.autoPinEdge(toSuperviewEdge: .right, withInset: 25)
    }
    
    func setupFacebookButtonConstraints() {
        facebookSignInButton.autoPinEdge(.top, to: .bottom, of: googleSignInButton, withOffset: 10)
        facebookSignInButton.autoPinEdge(toSuperviewEdge: .left, withInset: 28)
        facebookSignInButton.autoPinEdge(toSuperviewEdge: .right, withInset: 28)
    }
    
    override func updateConstraints() {
        if shouldSetupConstraints {
            setupGoogleButtonConstraints()
            setupFacebookButtonConstraints()
            
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        
        //showEmailAddress()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Did log out of facebook")
    }
    
    lazy var googleSignInButton: GIDSignInButton = {
        let button = GIDSignInButton()
        return button
    }()
    
    lazy var facebookSignInButton: UIButton = {
        let button = FBSDKLoginButton()
        button.delegate = self
        button.readPermissions = ["email", "public_profile"]
        return button
    }()
    
    
}

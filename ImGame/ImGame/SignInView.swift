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
        addSubview(logo)
        addSubview(signinButtonContainer)
        signinButtonContainer.addSubview(emailTextField)
        signinButtonContainer.addSubview(passwordTextField)
        signinButtonContainer.addSubview(loginButton)
        signinButtonContainer.addSubview(createAccountButton)
//        signinButtonContainer.addSubview(googleSignInButton)
//        signinButtonContainer.addSubview(facebookSignInButton)
        addSubview(googleSignInButton)
        addSubview(facebookSignInButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLogoConstraints() {
        logo.autoPinEdge(toSuperviewEdge: .top, withInset: 30)
        //logo.autoSetDimensions(to: CGSize(width: 35, height: 35)
        logo.autoSetDimension(.height, toSize: 125)
        logo.autoSetDimension(.width, toSize: 125)
        logo.autoAlignAxis(toSuperviewMarginAxis: .vertical)
    }
    
    func setupTextFieldConstraints() {
        emailTextField.autoPinEdge(toSuperviewEdge: .top, withInset: 60)
        emailTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 25)
        emailTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 25)
        emailTextField.autoSetDimension(.height, toSize: 35)
        
        passwordTextField.autoPinEdge(.top, to: .bottom, of: emailTextField, withOffset: 10)
        passwordTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 28)
        passwordTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 28)
        passwordTextField.autoSetDimension(.height, toSize: 35)
        
        loginButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 30)
        loginButton.autoPinEdge(toSuperviewEdge: .left, withInset: 25)
        loginButton.autoPinEdge(toSuperviewEdge: .right, withInset: 25)
        loginButton.autoSetDimension(.height, toSize: 35)
        
        
    }
    
    func setupContainerConstraints() {
        signinButtonContainer.autoPinEdge(toSuperviewEdge: .right, withInset: 45)
        signinButtonContainer.autoPinEdge(toSuperviewEdge: .left, withInset: 45)
        signinButtonContainer.autoPinEdge(.top, to: .bottom, of: logo, withOffset: 50)
        signinButtonContainer.autoSetDimension(.height, toSize: screenSize.height / 3)
    }
    
    func setupGoogleButtonConstraints() {
        googleSignInButton.autoPinEdge(.top, to: .bottom, of: signinButtonContainer, withOffset: 45)
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
            setupLogoConstraints()
            setupContainerConstraints()
            
            setupTextFieldConstraints() 
            
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
    
    internal lazy var logo: UIImageView = {
        let image = UIImageView()
        //image.backgroundColor = UIColor.black
        image.image = UIImage(named: "IMGame_Logo (1)")
        return image
    }()
    
    internal lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        return textField
    }()
    
    internal lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var googleSignInButton: GIDSignInButton = {
        let button = GIDSignInButton()
        return button
    }()
    
    internal lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor(red:0.99, green:0.93, blue:0.13, alpha:1.0)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    internal lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Account", for: .normal)
        button.backgroundColor = UIColor(red:0.99, green:0.93, blue:0.13, alpha:1.0)
        return button
    }()
    
    lazy var facebookSignInButton: UIButton = {
        let button = FBSDKLoginButton()
        button.delegate = self
        button.readPermissions = ["email", "public_profile"]
        return button
    }()
    
    internal lazy var signinButtonContainer: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor.blue
        return view
    }()
    
    
}

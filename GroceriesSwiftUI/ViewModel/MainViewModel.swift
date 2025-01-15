//
//  MainViewModel.swift
//  GroceriesSwiftUI
//
//  Created by Saurabh Jaiswal on 10/01/25.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared: MainViewModel = MainViewModel()
    
    @Published var textUsername: String = ""
    @Published var textEmail: String = ""
    @Published var textPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var isUserLogin: Bool = false
    @Published var userObj: UserModel = UserModel(dict: [:])
    
    init() {
        
        if(Utils.UDValueBool(key: Globs.userLogin)) {
            // user login
            self.setUserData(uDict: Utils.UDValue(key: Globs.userPayloadKey) as? NSDictionary ?? [:])
        } else {
            // user not login
        }
        
        #if DEBUG
        textUsername = "Test User"
        textEmail = "test@gmail.com"
        textPassword = "123456"
        #endif
    }
    
    // MARK: Service Call
    
    func serviceCallLogin() {
        
        if(!textEmail.isValidEmail) {
            self.showError = true
            self.errorMessage = "Please enter a valid email"
            return
        }
        
        if (textPassword.isEmpty) {
            self.errorMessage = "Please enter a valid password"
            self.showError = true
            return
        }
        ServiceCall.post(parameter: ["email": textEmail, "password": textPassword, "device_token": ""], path: Globs.SV_LOGIN) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    print(response)
                    self.setUserData(uDict: response.value(forKey: KKey.payload) as? NSDictionary ?? [:])
                } else {
                    self.showError = true
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Failed"
                }
            }
        } failure: { error in
            self.showError = true
            self.errorMessage = error?.localizedDescription ?? "Failed"
        }

    }
    
    
    func serviceCallSignUp() {
        
        if(textUsername.isEmpty) {
            self.showError = true
            self.errorMessage = "Please enter a valid username"
            return
        }
        
        if(!textEmail.isValidEmail) {
            self.showError = true
            self.errorMessage = "Please enter a valid email"
            return
        }
        
        if (textPassword.isEmpty) {
            self.errorMessage = "Please enter a valid password"
            self.showError = true
            return
        }
        ServiceCall.post(parameter: ["username": textUsername, "email": textEmail, "password": textPassword, "device_token": ""], path: Globs.SV_SIGN_UP) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    print(response)
                    self.setUserData(uDict: response.value(forKey: KKey.payload) as? NSDictionary ?? [:])
                } else {
                    self.showError = true
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Failed"
                }
            }
        } failure: { error in
            self.showError = true
            self.errorMessage = error?.localizedDescription ?? "Failed"
        }
    }
    
    func setUserData(uDict: NSDictionary) {
        Utils.UDSET(data: uDict, key: Globs.userPayloadKey)
        Utils.UDSET(data: true, key: Globs.userLogin)
        self.userObj = UserModel(dict: uDict)
        self.isUserLogin = true
        
        self.textUsername = ""
        self.textEmail = ""
        self.textPassword = ""
        self.isShowPassword = false
    }
}


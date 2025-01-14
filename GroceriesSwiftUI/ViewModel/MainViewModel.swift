//
//  MainViewModel.swift
//  GroceriesSwiftUI
//
//  Created by Saurabh Jaiswal on 10/01/25.
//

import SwiftUI

class MainViewModel: ObservableObject {
    static var shared: MainViewModel = MainViewModel()
    
    @Published var textEmail: String = ""
    @Published var textPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
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
        ServiceCall.post(parameter: ["email": textEmail, "password": textPassword], path: Globs.SV_LOGIN) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    print(response)
                    self.showError = true
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
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
}


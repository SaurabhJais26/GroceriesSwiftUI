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
}


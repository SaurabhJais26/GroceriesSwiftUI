//
//  FavouriteViewModel.swift
//  GroceriesSwiftUI
//
//  Created by Saurabh Jaiswal on 12/02/25.
//

import SwiftUI

class FavouriteViewModel: ObservableObject {
    static var shared: FavouriteViewModel = FavouriteViewModel()
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    @Published var listArr: [ProductModel] = []

    init() {
        serviceCallList()
    }
    // MARK: - ServiceCall
    
    func serviceCallList() {
        ServiceCall.post(parameter: [:], path: Globs.SV_FAVORITE_LIST, isToken: true) { responseObj in
            if let response = responseObj as? NSDictionary {
                if response.value(forKey: KKey.status) as? String ?? "" == "1" {
                    print(response)
                    
                    self.listArr = (response.value(forKey: KKey.payload) as? NSArray ?? []).map({ obj in
                        return ProductModel(dict: obj as? NSDictionary ?? [:])
                    })
                    
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

//
//  CountryCodePickerUI.swift
//  GroceriesSwiftUI
//
//  Created by Saurabh Jaiswal on 10/01/25.
//

import SwiftUI
import CountryPicker

struct CountryCodePickerUI: UIViewControllerRepresentable {
    @Binding var country: Country?
    
    class Coordinator: NSObject, CountryPickerDelegate {
        var parent: CountryCodePickerUI
        
        init(parent: CountryCodePickerUI) {
            self.parent = parent
        }
        
        func countryPicker(didSelect country: Country) {
            parent.country = country
        }
    }
    
    func makeUIViewController(context: Context) -> some CountryPickerViewController {
        let countryPicker = CountryPickerViewController()
        countryPicker.selectedCountry = "IN"
        countryPicker.delegate = context.coordinator
        
        return countryPicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    
}

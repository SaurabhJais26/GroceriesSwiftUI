//
//  LineTextField.swift
//  GroceriesSwiftUI
//
//  Created by Saurabh Jaiswal on 10/01/25.
//

import SwiftUI

struct LineTextField: View {
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    @State var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
           
            TextField(placholder, text: $txt)
                .keyboardType(keyboardType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(height:40)
            
            Divider()
            
        }
    }
}

struct LineSecureField: View {
    @State var title: String = "Title"
    @State var placholder: String = "Placholder"
    @Binding var txt: String
    @Binding var isShowPassword: Bool
    
    
    var body: some View {
        VStack {
            Text(title)
                .font(.customfont(.semibold, fontSize: 16))
                .foregroundColor(.textTitle)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            if (isShowPassword) {
                TextField(placholder, text: $txt)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .modifier( ShowButton(isShow: $isShowPassword))
                    
                    .frame(height:40)
            }else{
                SecureField(placholder, text: $txt)
                    .autocapitalization(.none)
                     .modifier( ShowButton(isShow: $isShowPassword))
                     .frame(height:40)
                
            }
            Divider()
        }
    }
}

#Preview {
    LineTextField(txt: .constant(""))
        .padding(20)
}

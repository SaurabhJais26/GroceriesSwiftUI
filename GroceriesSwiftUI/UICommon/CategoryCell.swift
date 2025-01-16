//
//  CategoryCell.swift
//  GroceriesSwiftUI
//
//  Created by Saurabh Jaiswal on 16/01/25.
//

import SwiftUI

struct CategoryCell: View {
    
    @State var color: Color = Color.yellow
    var didAddToCart: ( ()->() )?
    
    var body: some View {
        HStack {
            Image("pulses")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
            
            
            Text("Pulses")
                .font(.customfont(.bold, fontSize: 16))
                .foregroundColor(.primaryText)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            
        }
        .padding(15)
        .frame(width: 250, height: 100)
        .background(color.opacity(0.3))
        .cornerRadius(16)
    }
}

#Preview {
    CategoryCell()
}

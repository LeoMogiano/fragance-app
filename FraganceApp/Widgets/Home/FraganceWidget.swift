//
//  FraganceWidget.swift
//  FraganceApp
//
//  Created by Leo Mogiano on 2/10/24.
//

import SwiftUI

struct FraganceWidget: View {
    
    var image: String
    var name: String
    var type: String
    var price: Double
    
    var body: some View {
        VStack {
            
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                
            
            HStack{
                
                VStack(alignment: .leading, spacing: 5) {
                    
                    Text(name)
                        .cochinFont(size: 14)
                        .bold()
                    Text(type)
                        .cochinFont(size: 12)
                    
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 5) {
                    Text("Price")
                        .cochinFont(size: 14)
                    
                    Text(price, format: .currency(code: "USD"))
                        .cochinFont(size: 12)
                        .bold()
                }
                
            }.padding(.horizontal, 10)
                .padding(.top, 6)
                .padding(.bottom, 12)
                
            
        }
        .frame(width: 200, height: 250)
        .background(.white)
        .clipShape(.rect(cornerRadius: 12))
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    FraganceWidget(
        image: "CKEveryone",
        name: "SAUVAGE",
        type: "Eau de Parfum",
        price: 100.00
    )
}

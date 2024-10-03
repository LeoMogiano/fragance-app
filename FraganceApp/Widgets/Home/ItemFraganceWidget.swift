//
//  ItemFraganceWidget.swift
//  FraganceApp
//
//  Created by Leo Mogiano on 3/10/24.
//

//
//  FraganceWidget.swift
//  FraganceApp
//
//  Created by Leo Mogiano on 2/10/24.
//

import SwiftUI

struct ItemFraganceWidget: View {
    
    var image: String
    var name: String
    var type: String
    var price: Double
    var volume: Int
    
    var body: some View {
        VStack() {
            HStack{
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                
                VStack(alignment: .leading, spacing: 2){
                    Text(name)
                        .cochinFont(size: 18)
                        .bold()
                    
                    Text(type)
                        .cochinFont(size: 13)
                    
                    
                    Text("\(volume) ml")
                        .cochinFont(size: 12)
                    
                }.padding(.leading, 10)
                Spacer()
                VStack(alignment: .leading, spacing: 2){
                    Text("Price")
                        .cochinFont(size: 15)
                    
                    Text(price, format: .currency(code: "USD"))
                        .cochinFont(size: 18)
                        .bold()
                    
                }.padding(.trailing)
                
            }
        }.frame(maxWidth: .infinity, maxHeight: 80)
            .background(.white)
            .clipShape(.rect(cornerRadius: 12))
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}


#Preview {
    ItemFraganceWidget(
        image: "Sauvage",
        name: "SAUVAGE",
        type: "Eau de Parfum",
        price: 100.00,
        volume: 50
    )
}

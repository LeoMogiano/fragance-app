//
//  CustomToolbar.swift
//  FraganceApp
//
//  Created by Leo Mogiano on 30/9/24.
//

import SwiftUI

struct CustomToolbar: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "line.horizontal.3")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
            }

            Spacer()

            Text("Dior")
                .cochinFont(size: 34, color: .white)

            Spacer()

            Button(action: {}) {
                Image(systemName: "bag")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
//                    .symbolEffect(.wiggle)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 15)
        .background(Color.black)
    }
    
}

#Preview {
    CustomToolbar()
}


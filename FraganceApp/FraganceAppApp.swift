//
//  FraganceAppApp.swift
//  FraganceApp
//
//  Created by Leo Mogiano on 30/9/24.
//

import SwiftUI

@main
struct FraganceAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeScreen()
            
        }
    }
}

extension View {
    func cochinFont(size: CGFloat, color: Color = .black) -> some View {
        self.font(.custom("Cochin", size: size))
            .foregroundColor(color)
    }
}

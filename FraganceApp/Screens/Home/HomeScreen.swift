//
//  HomeScreen.swift
//  FraganceApp
//
//  Created by Leo Mogiano on 30/9/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var searchText: String = ""
    @State private var selectedTab: Int = 0
    
    var options: [String] = ["All", "Popular", "Men", "Women"]
    
    var body: some View {
        VStack{
            CustomToolbar()
            Spacer()
                .frame(height: 5)
            CustomTextField(
                searchText: $searchText,
                backgroundColor: Color.white,
                cornerRadius: 12,
                content: {
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 24))
                        Text("Search")
                    }
                    .foregroundStyle(.gray)
                }
            )
            
            
            VStack {
                HStack(spacing:0) {
                    ForEach(0..<options.count, id: \.self) { index in
                        Button(action: {selectedTab = index}) {
                            VStack {
                                Text(options[index])
                                    .foregroundColor(selectedTab == index ? .white : .gray)
                                    .padding(.vertical, 10)
                            }
                            .frame(maxWidth: .infinity)
                            .overlay(
                                selectedTab == index ? Rectangle()
                                    .fill(Color.white)
                                    .frame(width: 20, height: 2)
                                    .padding(.top, 35)
                                : nil
                            )
                        }
                    }
                }
                .background(Color.black)
                
                Spacer().frame(height: 30)
                if selectedTab == 0 {
                    FirstView()
                } else if selectedTab == 1 {
                    FirstView()
                } else if selectedTab == 2 {
                    FirstView()
                } else {
                    FirstView()
                }
            }
            
            
            
        }.background(Color.black)
         .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    HomeScreen()
}

struct FirstView: View {
   
    var body: some View {
        
        VStack() {
            
            HStack (spacing: 4) {
                Text("Popular").bold()
                Text("Collection")
            }.cochinFont(size: 20)
            .padding(.bottom, 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    
                    FraganceWidget(
                        image: "Sauvage",
                        name: "Sauvage",
                        type: "Eau de Parfum",
                        price: 100.00
                    )
                    FraganceWidget(
                        image: "OMLucky",
                        name: "One Million Lucky",
                        type: "Eau de Toilette",
                        price: 80.00
                    )
                    FraganceWidget(
                        image: "CKEveryone",
                        name: "CK Everyone",
                        type: "Eau de Toilette",
                        price: 50.00
                    )
                    
                }
            } .scrollClipDisabled()
            .scrollIndicators(.hidden)
           
            Spacer().frame(height: 24)
            
            HStack (spacing: 4) {
                Text("Recommended").bold()
                Text("Collection")
            }.cochinFont(size: 20)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 15){
                ItemFraganceWidget(
                    image: "Sauvage",
                    name: "SAUVAGE",
                    type: "Eau de Parfum",
                    price: 100.00,
                    volume: 50
                )
                ItemFraganceWidget(
                    image: "CKEveryone",
                    name: "CK Everyone",
                    type: "Eau de Toilette",
                    price: 50.00,
                    volume: 200
                )
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(25)
        .background(.white)
        .clipShape(
            .rect(
                topLeadingRadius: 50,
                topTrailingRadius: 50
            )
        )
    }
}


struct CustomTextField<Content: View>: View {
    
    @Binding var searchText: String
    var backgroundColor: Color = .white
    var cornerRadius: CGFloat = 10
    var padding: CGFloat = 15
    var fontSize: CGFloat = 20
    
    var content: () -> Content
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        TextField("", text: $searchText)
            .padding(padding)
            .background(backgroundColor)
            .foregroundStyle(.black)
            .clipShape(.rect(cornerRadius: cornerRadius))
            .font(.system(size: fontSize))
            .focused($isFocused)
            .overlay(
                HStack {
                    if searchText.isEmpty && !isFocused {
                        content()
                    }
                    Spacer()
                }
                .padding(.horizontal, 10)
            )
            .padding()
            .onTapGesture {
                isFocused = true
            }
    }
}


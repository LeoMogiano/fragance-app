//
//  DetailScreen.swift
//  FraganceApp
//
//  Created by Leo Mogiano on 6/10/24.
//

import SwiftUI

struct DetailScreen: View {
    
    let name: String
    let brand: String
    let price: Double
    let image: String
    let code: String
    let rating: Double
    
    @State private var isFavorite: Bool = false
    
    var body: some View {
        
        NavigationView{
            VStack {
                
                GeometryReader { geometry in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: geometry.size.width)
                        .clipShape(
                            .rect(
                                bottomLeadingRadius: 55,
                                bottomTrailingRadius: 55
                            )
                        )
                }.frame(maxHeight: 500)
                Spacer()
                HStack{
                    VStack(alignment: .leading){
                        Text(name)
                            .cochinFont(size: 24, color: .gray)

                        Text(brand)
                            .cochinFont(size: 20, color: .white)
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        Text("Price")
                            .cochinFont(size: 24, color: .gray)
                
                        Text(price, format: .currency(code: "USD"))
                            .cochinFont(size: 20, color: .white)
                    }
                }.padding(.horizontal, 20)
                   Spacer()
                
                JustifiedText("Dior fragrance blends elegance and luxury, offering refined scents that leave a lasting impression with their unique, timeless compositions.")
                    .padding(.horizontal, 20)
                    .frame( maxHeight: 60)
                Spacer()
                HStack{
                    VStack(alignment: .leading){
                        Text("Product Code")
                            .cochinFont(size: 20, color: .gray)

                        Text(code)
                            .cochinFont(size: 16, color: .white)
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        Text("Ratings")
                            .cochinFont(size: 20, color: .gray)
                
                        StarRatingView(rating: rating)
                        
                    }
                }.padding(.horizontal, 20)
                  
                
                Spacer()
                  
                Button {
                    
                } label: {
                    HStack {
                        Text("Add to Bag")
                            .foregroundStyle(.black)
                        Image(systemName: "bag")
                            .font(.system(size: 16))
                            .foregroundStyle(.black)
                    }.frame(maxWidth: .infinity)
                        .padding(.vertical, 7)
                }
                
                .buttonStyle(.borderedProminent)
                .tint(.white)
          
                .padding(.horizontal, 20)
                
               
                  Spacer()
            }
            .background(.black)
            .ignoresSafeArea(.all)
        }
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {isFavorite.toggle()}) {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(.black)


                }
            }
        }
        .tint(.black)
        
    }
}

struct JustifiedText: UIViewRepresentable {
    private let text: String
    private let maxLines: Int

    init(_ text: String, maxLines: Int = 3) { // Se define un máximo de 3 líneas por defecto
        self.text = text
        self.maxLines = maxLines
    }

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.textAlignment = .justified
        textView.font = UIFont(name: "Cochin", size: 14)
        textView.textColor = .white
        textView.backgroundColor = .black
        textView.isScrollEnabled = true // No habilitar scroll

        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

struct StarRatingView: View {
    var rating: Double // La calificación que se va a mostrar

    var body: some View {
        HStack(spacing: 2) {
            ForEach(1...5, id: \.self) { index in
                if index <= Int(rating) {
                    Image(systemName: "star.fill") // Estrella llena
                        .foregroundColor(.yellow)
                } else if index == Int(rating) + 1 && rating.truncatingRemainder(dividingBy: 1) >= 0.5 {
                    Image(systemName: "star.lefthalf.fill") // Estrella media
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "star") // Estrella vacía
                        .foregroundColor(.gray)
                }
            }
        }
    }
}



#Preview {
    DetailScreen(name: "Sauvage", brand: "DIOR", price: 4.5, image: "Sauvage", code: "#SVG4343", rating: 4.5)
}

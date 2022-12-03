//
//  CoffeeshopDetailView.swift
//  iSwiftStudySummary
//
//  Created by Ahmad Syarifuddin Randiko on 03/12/22.
//

import SwiftUI
import CachedAsyncImage

struct CoffeeshopDetailView: View {
    let coffeeshop: CoffeeshopModel
    
    var body: some View {
        ZStack{
            CachedAsyncImage( url: URL(string:coffeeshop.image))
                .ignoresSafeArea()
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
            VStack{
                Text(coffeeshop.name)
                    .font(.system(.title, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 4)
                Text(coffeeshop.location)
                    .font(.system(.title2, design: .rounded))
                    .frame(maxWidth: 240)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .padding(.all,24)
            .background(.black.opacity(0.5))
            .cornerRadius(10)
        }
    }
    
}

struct CoffeeshopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeshopDetailView(coffeeshop: CoffeeshopModel(image:  "https://res.cloudinary.com/moyadev/image/upload/v1669548108/iSwift/sesi4/charity2_mbnc3n.jpg", name: "Lanevo Cafe", location: "Jl. Jawa No. 46, Kota Bandung", review: "Unity heritage and modern concept and live music performance every weekend", isFavorite: false))
    }
}

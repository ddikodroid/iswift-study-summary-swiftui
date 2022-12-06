//
//  GalleryView.swift
//  iSwiftStudySummary
//
//  Created by Ahmad Syarifuddin Randiko on 06/12/22.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - Properties
    var coffeeshops = coffeeshopList

    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 32){
                // MARK: - Slider
                Slider(value: $gridColumn, in: 2...6, step: 1.0)
                    .padding(.horizontal)
                    .onChange(of: gridColumn){ value in
                        withAnimation(.default) {
                            gridSwitch()
                        }
                    }
                // MARK: - Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 12){
                    ForEach(coffeeshops){ coffeeshop in
                        let url = URL(string: coffeeshop.image)
                        AsyncImage(url: url){ image in
                            image.resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay{
                                    Circle().stroke(Color.mint, lineWidth: 2)
                                }
                            
                        } placeholder: {
                            Color.gray.opacity(0.1)
                        }
                    }
                    .onAppear{
                        gridSwitch()
                    }
                }
            }
            .padding(.vertical, 24)
            .padding(.horizontal, 24)
        }
    }
    // MARK: - Function
    func gridSwitch (){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
}
// MARK: - Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

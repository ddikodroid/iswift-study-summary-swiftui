//
//  CoffeeshopListView.swift
//  iSwiftStudySummary
//
//  Created by Ahmad Syarifuddin Randiko on 03/12/22.
//

import SwiftUI
import ActivityView
import CachedAsyncImage

struct CoffeeshopListView: View {
    //: - Properties
    @State var coffeeshops = coffeeshopList
    @State private var isLoading: Bool = true
    
    //: - Body
    var body: some View {
            List {
                ForEach(coffeeshops) { coffeeshop in
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: CoffeeshopDetailView(coffeeshop: coffeeshop)){
                            EmptyView()
                        }
                        .opacity(0)
                        CoffeeshopCardView(coffeeshop: coffeeshop)
                          
                    }
                }
                .onDelete{ idx in
                    coffeeshops.remove(atOffsets: idx)
                }
                .redacted(reason: isLoading ? .placeholder : [])
                .onAppear {
                    fetchData()
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Coffeeshop")
        
    }
    // MARK: - Functions
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}
    
    //MARK: - Previews
    struct CoffeeshopListView_Previews: PreviewProvider {
        static var previews: some View {
            CoffeeshopListView()
        }
    }
    
    struct CoffeeshopCardView: View {
        @State var coffeeshop: CoffeeshopModel
        @State private var isShowingPinLocationAlert = false
        @State private var item: ActivityItem?
        
        var body: some View {
            HStack{
                CachedAsyncImage( url: URL(string:coffeeshop.image)){
                    image in image.resizable().scaledToFill()
                }placeholder: {
                    Color.gray.opacity(0.1)
                }
                .frame(width: 120, height: 120)
                .cornerRadius(24)
                
                VStack(alignment: .leading, spacing: 0){
                    Text(coffeeshop.name)
                        .font(.system(size: 24, design: .rounded))
                        .fontWeight(.bold)
                    
                    Text(coffeeshop.location)
                        .font(.system(size: 18, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                    
                    if coffeeshop.isFavorite {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.yellow)
                            .padding(.vertical)
                        
                    }
                }.padding(.leading, 8) //: VStack
            }
            .swipeActions(edge: .leading, allowsFullSwipe: false){
                Button{
                    isShowingPinLocationAlert.toggle()
                } label: {
                    Image(systemName: "pin")
                }
                .tint(.orange)
                
                Button{
                    item = ActivityItem(items: "Share \(coffeeshop.name) to your friends or relatives.")
                } label: {
                    Image(systemName: "square.and.arrow.up")
                }
                .tint(.mint)
            }
            .contextMenu{
                Button{
                    isShowingPinLocationAlert.toggle()
                }label: {
                    HStack{
                        Text("Pin this location")
                        Image(systemName: "pin")
                    }
                }
                Button{
                    coffeeshop.isFavorite.toggle()
                }label: {
                    HStack{
                        Text(coffeeshop.isFavorite ? "Remove from favorite" : "Add to favorite")
                        Image(systemName: coffeeshop.isFavorite ? "heart.slash" : "heart")
                    }
                }
                
                Button{
                    item = ActivityItem(items: "Share \(coffeeshop.name) to your friends or relatives.")
                }label: {
                    HStack{
                        Text("Share")
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
            .alert(isPresented: $isShowingPinLocationAlert){
                Alert(title: Text("Not available yet"), message: Text("This feature is not available yet🙏"), dismissButton: .default(Text("🆗 Buddy 👌")))
            }
            .activitySheet($item)

        }
    }


    


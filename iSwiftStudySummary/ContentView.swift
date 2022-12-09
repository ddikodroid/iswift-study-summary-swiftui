//
//  ContentView.swift
//  iSwiftStudySummary
//
//  Created by Ahmad Syarifuddin Randiko on 03/12/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: Properties
    //Variable selectedTab is used for moving between tabs programmatically.
    @State private var selectedTab: Tabs = .coffeeshop
    
    //MARK: Body
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab){
                    CoffeeshopListView()
                        .tabItem{
                            Image(systemName: "square.grid.2x2")
                            Text("Browse")
                        }
                        .tag(Tabs.coffeeshop)
                GalleryView()
                    .tabItem{
                        Image(systemName: "play.rectangle")
                        Text("Gallery")
                    }
                    .tag(Tabs.gallery)
                
                AnimationView()
                    .tabItem{
                        Image(systemName: "scribble.variable")
                        Text(Tabs.animation.rawValue.capitalized)
                    }
                    .tag(Tabs.animation)
                    
                    Text("Loans".uppercased())
                        .font(.system(.largeTitle, design: .rounded))
                        .tabItem{
                            Image(systemName: "rectangle.and.text.magnifyingglass")
                            Text("Loans")
                        }
                        .tag(Tabs.loans)
                    
                    Text("Settings".uppercased())
                        .font(.system(.largeTitle, design: .rounded))
                        .tabItem{
                            Image(systemName: "slider.horizontal.3")
                            Text("Settings")
                        }
                        .tag(Tabs.settings)
                } //- TabView
            .tint(.indigo)
            .navigationBarTitle(selectedTab.rawValue.capitalized)
        }

    }
}

//MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: - Enums
enum Tabs: String {
    case coffeeshop
    case gallery
    case animation
    case loans
    case settings
}

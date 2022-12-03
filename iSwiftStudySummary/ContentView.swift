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
                    
                    VStack {
                        Text("Watch".uppercased())
                            .font(.system(.largeTitle, design: .rounded))
                        
                        Button{
                            selectedTab = Tabs.settings
                        }label: {
                            Text("Show Settings")
                                .font(.system(.headline, design: .rounded))
                                .padding()
                                .foregroundColor(.white)
                                .background(.indigo)
                                .cornerRadius(12)
                        }
                        
                    }
                    .tabItem{
                        Image(systemName: "play.rectangle")
                        Text("Watch")
                    }
                    .tag(Tabs.watch)
                    
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
    case watch
    case loans
    case settings
}

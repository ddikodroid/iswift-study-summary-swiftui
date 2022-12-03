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
    @State private var selectedTab: String = "Browse"
    
    //MARK: Body
    var body: some View {
        NavigationStack {
            TabView(selection: $selectedTab){
                Text("Browse".uppercased())
                    .font(.system(.largeTitle, design: .rounded))
                    .tabItem{
                        Image(systemName: "square.grid.2x2")
                        Text("Browse")
                    }
                    .tag("Browse")
                
                VStack {
                    Text("Watch".uppercased())
                        .font(.system(.largeTitle, design: .rounded))
                    
                    Button{
                        selectedTab = "Settings"
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
                .tag("Watch")
                
                Text("Loans".uppercased())
                    .font(.system(.largeTitle, design: .rounded))
                    .tabItem{
                        Image(systemName: "rectangle.and.text.magnifyingglass")
                        Text("Loans")
                    }
                    .tag("Loans")
                
                Text("Settings".uppercased())
                    .font(.system(.largeTitle, design: .rounded))
                    .tabItem{
                        Image(systemName: "slider.horizontal.3")
                        Text("Settings")
                    }
                    .tag("Settings")
            } //- TabView
            .tint(.indigo)
        } //- NavigationStack

    }
}

//MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

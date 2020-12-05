//
//  ContentView.swift
//  blm
//
//  Created by Aabid Shamji and Carlton Segbefia.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userCity = UserDefaults.standard.string(forKey: "userCity")

    
    @ViewBuilder
    var body: some View {
        NavigationView {
            Section{
                if (userCity != nil) {
                    SideBarView(destinationView: HomeView(), "Pronto!")
                }else{
                    ChangeCityView()
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//
//  FreindFinderView.swift
//  Pronto
//
//  Created by Carlton Segbefia on 10/28/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI

struct FreindFinderView: View {
    var body: some View {
        VStack{
            Text("A resource to locate anyone who’s been arrested and connect them with free legal aid and bail")
                .multilineTextAlignment(.center)
                .padding()
            Text("Keep in mind that your device may store your coordinates.\n\nWe suggest you turn off location services before you travel any the protest, and leave it off until you return.")
                .multilineTextAlignment(.center)
                .padding()
            NavigationLink(destination: FreindFinderMapView()){
                Text("I’m not at a protest")
                    .frame(minWidth: 230)
                    .font(Constants.buttonFont)
                    .padding()
                    .background(Constants.headingColor)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }.padding()
            Button(action: {}) {
                NavigationLink(destination: SideBarView(destinationView:HomeView(), "Pronto!") ){
                Text("Take me back")
                    .frame(minWidth: 230)
                    .font(Constants.buttonFont)
                    .padding()
                    .background(Constants.headingColor)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                }
            }.padding()
        }
    }
}

struct FreindFinderView_Previews: PreviewProvider {
    static var previews: some View {
        FreindFinderView()
    }
}

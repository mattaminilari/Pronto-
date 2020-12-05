//
//  MenuView.swift
//  Pronto
//
//  Created by Carlton Segbefia on 10/25/20.
//  Copyright © 2020 Paul Hill. All rights reserved.


import SwiftUI

struct MenuView: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(){
                    Image("back")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width)
                        .clipped()
                        .edgesIgnoringSafeArea(.vertical)
        VStack(alignment: .leading, spacing: 20) {
            NavigationLink(destination:SideBarView(destinationView: HomeView(), "Pronto!")){Image("logo-noback")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geometry.size.width*0.68)
            }
            NavigationLink(destination: SideBarView(destinationView: OrganisationsView(), "Take Action")) {
                Text("Take Action")
                    .font(Constants.subHeadingFont)
                    .foregroundColor(Constants.headingColor)
            }
            NavigationLink(destination: SideBarView(destinationView: FreindFinderView(), "Pronto! Finder")) {
                Text("Pronto! Finder")
                    .font(Constants.subHeadingFont)
                    .foregroundColor(Constants.headingColor)
            }
            
            NavigationLink(destination: SideBarView(destinationView: BailLegalMenuView(), "Bail + Legal")) {
                Text("Bail + Legal")
                    .font(Constants.subHeadingFont)
                    .foregroundColor(Constants.headingColor)
            }
            NavigationLink(destination: SideBarView(destinationView: ResourcesView(),"Resources")) {
                Text("Resources")
                    .font(Constants.subHeadingFont)
                    .foregroundColor(Constants.headingColor)
            }
            HStack{
                NavigationLink(destination: AboutView()){
                   Text("About")
                }
                Text("      ")
                NavigationLink(destination: ChangeCityView()){
                   Text("Change City")
                }
            }
            Spacer()
                .frame(height: 30)
        }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color.white)
            .edgesIgnoringSafeArea(.all)
    }
    }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

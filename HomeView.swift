        
//  HomeView.swift
//  Pronto
//
//  Created by Carlton Segbefia on 10/26/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI
import Foundation
struct HomeView: View {
    
    private var userCity = UserDefaults.standard.string(forKey: "userCity")
    
    private var organisations: [Organisation] = Bundle.main.decode(
        [Organisation].self,
        from: "orginfo.json")
    
    
    func sortOrganisationHelper(this:Organisation, that:Organisation) -> Bool {
        return this.org_name < that.org_name
    }
    
    var TakeAction: some View{
        VStack(alignment:.leading){
            NavigationLink(destination: SideBarView(destinationView:OrganisationsView(),"Take Action")){
            Text("TAKE ACTION")
                .font(Constants.heading2Font)
                .foregroundColor(Constants.headingColor)
                
            }
            ScrollView(.horizontal){
                HStack(spacing: 25) {
                    ForEach(organisations.filter{ $0.location == userCity}.sorted(by: sortOrganisationHelper))
                    { org in
                        NavigationLink(destination: OrgDetailView(org: org)) {
                            VStack{
                                Image("org_"+org.id)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 104)
                                    .clipped()
                                //                                Text(org.org_name)
                                //                                    .foregroundColor(Constants.textColor)
                            }
                        }
                    }
                }
            }.frame(height:104)
        }
    }
    
    var BailLegal: some View{
        VStack(alignment:.leading){
            NavigationLink(
                destination: SideBarView(destinationView:BailLegalMenuView(), "Bail + Legal")){
                Text("BAIL+LEGAL")
                    .font(Constants.heading2Font)
                    .foregroundColor(Constants.headingColor)
            }
            GeometryReader { geometry in
                HStack(spacing: 20){
                    NavigationLink(
                        destination: SideBarView(destinationView:BailListView(), "Bail + Legal")){
                    VStack(){
                        Image("dollar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .clipped()
                        Text("Bail Funds")
                            .font(Constants.textFont)
                    }.frame(width: geometry.size.width * 0.47, height: 171, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.0), lineWidth: 1)
                        
                    ).background(RoundedRectangle(cornerRadius: 7).fill(Constants.cardBackgroundColor))
                    }
                    
                    
                    NavigationLink(
                        destination: SideBarView(destinationView:LegalListView(), "Bail + Legal")){
                    VStack(){
                        Image("legal")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .clipped()
                        Text("Legal Help")
                            .font(Constants.textFont)
                    }.frame(width: geometry.size.width * 0.47, height: 171, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.0), lineWidth: 1)
                        
                    ).background(RoundedRectangle(cornerRadius: 7).fill(Constants.cardBackgroundColor))
                    }
                }
            }.frame(height:171)
            
        }
    }
    
    var FreindFinder: some View{
        Section{
            VStack(alignment:.leading){
                HStack{
                NavigationLink(
                    destination: SideBarView(destinationView:FreindFinderView(), "Pronto! Finder")){
                Text("PRONTO! FINDER")
                    .font(Constants.heading2Font)
                    .foregroundColor(Constants.headingColor)
                }
                NavigationLink(
                    destination: SideBarView(destinationView:NoCityView(), "Pronto! Finder")){
                    Image(systemName: "questionmark.circle")
                    .font(Constants.heading2Font)
                        .foregroundColor(Color.gray)
                }
                }
                NavigationLink(
                    destination: SideBarView(destinationView:FreindFinderView(), "Pronto! Finder")){
                Image("Map Preview")
                    .resizable()
                    .frame(width: 318, height: 126)
                    .clipped()
            }
            }
            
        }
    }
    
    var Resources: some View{
        VStack(alignment:.leading){
            NavigationLink(
                destination: SideBarView(destinationView:ResourcesView(),"Resources")){
            Text("RESOURCES")
                .font(Constants.heading2Font)
                .foregroundColor(Constants.headingColor)
            }
            NavigationLink(
                destination: SideBarView(destinationView:ResourcesView(),"Resources")){
            Text("Protest safety information  & more")
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .foregroundColor(Constants.textColor)
                .frame(width: 318, height: 78)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.0), lineWidth: 1)
                    
                ).background(RoundedRectangle(cornerRadius: 7).fill(Constants.cardBackgroundColor))
            }
        }
    }
    
    var body: some View {
        ScrollView{
        VStack(){
            TakeAction
            Spacer()
            BailLegal
            Spacer()
            FreindFinder
            Spacer()
            Resources
        }
        .padding(.horizontal,28)
        
    }
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



//
//  InformationView.swift
//  blm
//
//  Created by Aabid Shamji on 6/7/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI



struct AboutView: View {
    
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: Constants.headingUIColor, .font: Constants.headingUIFont]
    }
    
    var body: some View {
        ZStack{
            Constants.backgroundColor.edgesIgnoringSafeArea(.all)
            ScrollView(){
                VStack{
                    Text("Welcome to Pronto! We’re here to easily connect you to organizations looking for volunteers and donors. Featuring Creature Friend Finder, you will always have pro bono legal assistance and the ability to find any friend of yours who has been arrested in your pocket at all times.\n\nIf you’re interest in volunteering for us as we work to include more organizations, please contact us at OutreachPronto@gmail.com and follow us on instagram @Pronto_App!\n\n Stay safe and take care of one another,\n\n\n Pronto! Team")
                        .font(Constants.textFont)
                        .padding()
                
                }
            }.navigationBarTitle("About Pronto!")
        }
        
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

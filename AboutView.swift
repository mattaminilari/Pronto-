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
                    Text("Welcome!\n\nPronto! is the easiest way to donate or volunteer to organizations fighting for the Black Lives Matter movement. You can subscribe to Zoe’s Black Radicalisms to receive a short text in Black Radicalism every day or read through Patia's guide to dismantling racism. If a friend of yours has been arrested, locate them and connect with bail advocacy groups through Creature Friend Finder.\n\nOur goal is to simply help everyone help others. Our list of organizations and resources is constantly growing. If you'd like to suggest an organization that should be included in Pronto!, please email us at OutreachPronto@gmail.com. To stay up to date on what different organizations are up, follow us @Paulhill.here on Instagram.\n\nBest,\nPaul Hill")
                        .font(Constants.textFont)
                        .foregroundColor(Constants.textColor)
                        .padding()
                
                }
            }
//            .navigationBarTitle("About Pronto!")
        }
        
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

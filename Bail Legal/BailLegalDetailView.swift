//
//  BailLegalDetailView.swift
//  Pronto
//
//  Created by Carlton Segbefia on 10/28/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI

struct BailLegalDetailView: View {
    var obj: BailLegalObject
    
    var libURL = "https://www.libertyfund.org/about/"
    var body: some View {
        ZStack{
            Constants.backgroundColor.edgesIgnoringSafeArea(.all)
            ScrollView(){
                VStack(){
                    Text(obj.name)
                        .font(Constants.subHeadingFont)
                        .fontWeight(.semibold)
                        .frame(width: 300.0, height: 100.0)
                    
                    Text(obj.description)
                        .font(Constants.textFont)
                        .foregroundColor(Constants.textColor)
                        .multilineTextAlignment(.center)
                        .padding([.top, .leading, .trailing], 0.0)
                        .frame(width: /*@START_MENU_TOKEN@*/280.0/*@END_MENU_TOKEN@*/, height: 250)
                    
                    
                    Button(
                        action: {UIApplication.shared.open( URL(string: self.obj.link)! )}) {
                        
                        Text("Learn More")
                            .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 35)
                            .font(Constants.buttonFont)
                            .padding()
                            .background(Constants.headingColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
            }.padding()
        }
    }
}


struct BailLegalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BailLegalDetailView(obj : BailLegalObject(id:"2",     name: "The Liberty Fund", description: "The Liberty Fund’s mission is to reduce the number of New Yorkers subjected to unnecessary pretrial detention while simultaneously providing them with much needed social services. Since August 2017, The Liberty Fund has been critical to the City’s overall decarceration efforts, first through our citywide Charitable Bail Program and now also through our ROR (Released On Recognizance) Program, both of which provide voluntary, person-centered, pretrial case management support.",phone_num: "",link: "https://www.libertyfund.nyc/mission-history/",location: "New York City",type: "bailfund"))
    }
}

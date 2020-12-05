//
//  LegalView.swift
//  blm
//
//  Created by Carlton Segbefia on 6/16/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import Foundation
import SwiftUI

struct LegalView: View {
    
    var findURL = "https://docs.google.com/spreadsheets/d/e/2PACX-1vR9ODS29XjvHjZLcrvjKwSivTsltyMQUK7evGBaJgQWaQu2pF81dCQiSHY4X6eNqcXycRBQ0f2MO_jl/pubhtml"
    
    
    private var userCity = UserDefaults.standard.string(forKey: "userCity")
    
    private var legalInfos: [LegalInfo] = Bundle.main.decode([LegalInfo].self, from: "legalinfo.json")
    
    var body: some View {
//        ScrollView{
        ZStack{
            Constants.backgroundColor.edgesIgnoringSafeArea(.all)
            Button(action: {
                UIApplication.shared.open( URL(string: self.findURL)! )
            }) {
            Image("finder")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
            }
            
//        List(legalInfos.filter{ $0.location == userCity}.sorted(by: sortLegalInfoHelper))
//        { legalInfo in
//            NavigationLink(destination: LegalDetailView(legalInfo: legalInfo)) {
////                 Image("legalInfo_"+legalInfo.id)
////                .resizable()
////                .scaledToFit()
////                .frame(width: 100)
////                 .clipped()
//                Text(legalInfo.name+" - "+legalInfo.phone_num)
//            }
//        }.listRowBackground(Constants.backgroundColor)
//            .navigationBarTitle(Text("Legal Help."))
//        }.background(Constants.backgroundColor)
    }
    }
    
    //    Helper  that takes two organisation and returns true if the name of the
    //first organisation is alphabetically before the name of the second
    //organisation.
    //Used to sort array of Organisations in descending order of name alphabetically
    func sortLegalInfoHelper(this:LegalInfo, that:LegalInfo) -> Bool {
        return this.name < that.name
    }
}

struct LegalView_Previews: PreviewProvider {
    static var previews: some View {
        LegalView()
    }
}

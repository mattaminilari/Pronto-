//
//  LegalListView.swift
//  Pronto
//
//  Created by Carlton Segbefia on 10/28/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI

struct LegalListView: View {
    
    private var userCity = UserDefaults.standard.string(forKey: "userCity")
    
//    private var userCity = "New York City"
    
    private var list: [BailLegalObject] = Bundle.main.decode(
        [BailLegalObject].self,
        from: "baillegal.json")
    
    
    var body: some View {
        ScrollView(){
            VStack(){
                
                Text("Legal Help")
                    .font(Constants.buttonFont)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.black)
                    .padding([.top, .leading, .trailing], 50.0)
                Divider()
                
                ForEach(list.filter{$0.location == userCity && $0.type == "legalhelp"})
                { obj in
                    NavigationLink(destination: BailLegalDetailView(obj: obj) ){
                        Text(obj.name)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .frame(minWidth: 230)
                            .font(Constants.buttonFont)
                            .padding(.vertical)
                            .background(Color.white)
                            .foregroundColor(Constants.headingColor)
                            .cornerRadius(10)
                        
                    }.padding()
                    Divider()
                }
            }.padding([.top, .leading])
        }
    }
}

struct LegalListView_Previews: PreviewProvider {
    static var previews: some View {
        LegalListView()
    }
}

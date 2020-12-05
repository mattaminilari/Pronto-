//
//  BailLegalMenuView.swift
//  Pronto
//
//  Created by Carlton Segbefia on 10/28/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI

struct BailLegalMenuView: View {
    var body: some View {
        GeometryReader{
            geo in

        VStack(alignment:.leading){
                NavigationLink(destination: SideBarView(destinationView: BailListView(), "Bail + Legal" )){
                    Text("Bail")
                        .frame(minWidth: 230)
                        .font(Constants.buttonFont)
                        .padding()
                        .background(Constants.headingColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.padding()
                Button(action: {}) {
                    NavigationLink(destination: SideBarView(destinationView: LegalListView(), "Bail + Legal" )){
                    Text("Legal")
                        .frame(minWidth: 230)
                        .font(Constants.buttonFont)
                        .padding()
                        .background(Constants.headingColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }.padding()
        }.padding()
        .frame(width: geo.size.width, height: geo.size.height)
        }
    }
    }

struct BailLegalMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BailLegalMenuView()
    }
}

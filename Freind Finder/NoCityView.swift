//
//  NoCityView.swift
//  Pronto
//
//  Created by Carlton Segbefia on 11/13/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI

struct NoCityView: View {
    var body: some View {
        ScrollView(){
            VStack{
                Text("Don't See Your City?")
                    .font(Constants.buttonFont)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30.0)
                    //.padding(.horizontal, 20)
                    .padding([.top, .leading, .trailing], 50.0)
                    .padding(.horizontal)
                
                Text("First, look up your friend in the ''Inmate Search Database''")
                    .font(Constants.buttonFont)
                    .fontWeight(.ultraLight)
                    .multilineTextAlignment(.center)
                    .padding(10.0)
                    .padding(.bottom, 40.0)
                    .padding(.horizontal, 30)
                
                Text("It is very likely that they will not appear.")
                    .font(Constants.buttonFont)
                    .fontWeight(.ultraLight)
                    .multilineTextAlignment(.center)
                    .padding(10.0)
                    .padding(.bottom, 35.0)
                    .padding(.horizontal, 30)
                Text("If this is the case, start calling the precinct closest to where your friend was arrested.")
                    .font(Constants.buttonFont)
                    .fontWeight(.ultraLight)
                    .multilineTextAlignment(.center)
                    .padding(0.0)
                    .padding(.horizontal, 30)
            }
        }
    }
}

struct NoCityView_Previews: PreviewProvider {
    static var previews: some View {
        NoCityView()
    }
}

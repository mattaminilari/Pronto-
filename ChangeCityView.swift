//
//  ChangeCityView.swift
//  Pronto
//
//  Created by Carlton Segbefia on 10/29/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI

struct ChangeCityView: View {
    var cities = ["Atlanta","Chicago","Detroit","Houston",
                  "Los Angeles","Madison","Milwaukee",
                  "Minneapolis","New York City","Philadelphia",
                  "Portland","Washington, D.C."]
    
    @State private var selectedCity = 0
    @State private var hasSelectedCity: Bool? = false
    
    @State private var userCity = UserDefaults.standard.string(forKey: "userCity")
    
    var body: some View {
        ZStack{
            Constants.backgroundColor.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Please Select your City.")
                    .font(Constants.headingFont)
                    .multilineTextAlignment(.center)
                    .padding().fixedSize(horizontal: false, vertical: true)
                    .foregroundColor(Constants.headingColor)
                
                Picker("Cities", selection: $selectedCity) {
                    ForEach(0..<cities.count) {
                        Text(self.cities[$0])
                            .font(Constants.subHeadingFont)
                            .foregroundColor(Constants.textColor)
                    }
                }.pickerStyle(WheelPickerStyle())
                .multilineTextAlignment(.center)
                .labelsHidden()
                .padding()
                
                NavigationLink(destination: SideBarView(destinationView: HomeView(),"Pronto!"), tag: true, selection: $hasSelectedCity) {
                    EmptyView()
                }
                
                Button(action: {
                    self.userCity = self.cities[self.selectedCity]
                    UserDefaults.standard.set(
                        self.cities[self.selectedCity],
                        forKey: "userCity")
                    self.hasSelectedCity = true
                }) {
                    Text("Done")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Constants.textColor)
                        .foregroundColor(Constants.backgroundColor)
                        .padding(10)
                        .border(Constants.textColor, width: 5)
                }.padding()
            }
        }
    }
}

struct ChangeCityView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeCityView()
    }
}

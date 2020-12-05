//
//  FreindFinderMapView.swift
//  Pronto
//
//  Created by Carlton Segbefia on 10/15/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI

struct FreindFinderMapView: View {
    
    @State private var showPopUp: Bool? = false
    @State private var annotation: PrecinctAnnotation? = PrecinctAnnotation()
    
    let strNumber = "7185741605"
    
    var popup: some View {
                VStack(alignment: .leading) {
                    Section{
                        HStack {
                            Text((annotation?.title)!)
                                .font(Constants.buttonFont)
                                .fontWeight(.semibold)
                            Button(action: {
                                
                                self.showPopUp = false
                                
                            }, label: {
                                Circle()
                                    .strokeBorder(Color.white, lineWidth: 1)
                                    .background(Image(systemName: "xmark").foregroundColor(.red))
                                    .frame(width: 30, height: 30)
                            }).offset(x: 10)
                        }
                        Divider()
                    }
                    Section {
                        Text("Address")
                            .font(.subheadline)
                            .fontWeight(.ultraLight)
                            .multilineTextAlignment(.leading)
                        
                        Text((annotation?.address)!)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                        
                        Divider()
                    }
                    Section {
                        Text("Phone")
                            .font(.subheadline)
                            .fontWeight(.ultraLight)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 0.50)
                        
                        Button(action: {
                            let dash = CharacterSet(charactersIn: "-(),. ")
                            
                            let cleanString =
                                strNumber.trimmingCharacters(in: dash)
                            
                            let tel = "tel://"
                            let formattedString = tel + cleanString
                            let url: NSURL = URL(string: formattedString)! as NSURL
                            print(formattedString)
                            UIApplication.shared.open(url as URL)
                            
                        }) {
                        Text((annotation?.telephone_1)!)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            
                        }
                        Divider()
                    }
                    Section {
                        
                        Text("Website")
                            .font(.subheadline)
                            .fontWeight(.ultraLight)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 0.50)
                        
                        Text((annotation?.link)!)
                            .font(.subheadline)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                        Divider()
                    }
                    Spacer()
                    NavigationLink(destination:CallGuideView()){
                        Text("Call Guide")
                            .multilineTextAlignment(.center)
                            .frame(minWidth: 100)
                            .font(Constants.buttonFont)
                            .padding()
                            .background(Constants.headingColor)
                            .foregroundColor(Constants.backgroundColor)
                            .cornerRadius(10)
                    }
                    
                }.padding()
                .background(Color.white)
                .frame(width: 300, height: 400)
                .cornerRadius(20)
                .shadow(radius: 20)
            }

    


var body: some View {
    ZStack {
        MapView(annotation: $annotation, showPopUp: $showPopUp)
        if (showPopUp!) {
            popup
        }
    }
    .edgesIgnoringSafeArea(.all)
}
}



struct FreindFinderMapView_Previews: PreviewProvider {
    static var previews: some View {
        FreindFinderMapView()
    }
}

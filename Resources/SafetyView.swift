//
//  SafetyView.swift
//  blm
//
//  Created by Carlton Segbefia on 6/15/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI

struct SafetyView: View {
    
    init(){
        UITableView.appearance().backgroundColor = Constants.backgroundUIColor
    }
    
    var infographics :[String] = ["infographic_1","infographic_2","infographic_3","infographic_4","infographic_5","infographic_11"]
    
    var body: some View {
        ZStack {
            Constants.backgroundColor.edgesIgnoringSafeArea(.all)
        ScrollView {

            VStack{
            GeometryReader { geometry in
                ImageCarouselView(numberOfImages: 6 ) {
                ForEach(self.infographics, id: \.self) { infographic in
                    Image(infographic)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                        .clipped()
                }
                }
            }
            .frame(height: 500, alignment: .center)
        }
            }
        }
}
}

struct SafetyView_Previews: PreviewProvider {
    static var previews: some View {
        SafetyView()
    }
}

//
//  CallGuideView.swift
//  Pronto
//
//  Created by Carlton Segbefia on 11/13/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI

struct CallGuideView: View {
    var body: some View {
        ScrollView(){
            VStack{
                Text("Calling Precincts:")
                    .font(Constants.headingFont)
                    .fontWeight(.regular)
                    // .foregroundColor(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 1.0))
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .background(Color.white)
                    .foregroundColor(Constants.headingColor)
                    //.padding(.bottom, 10.0)
                    //.padding(.horizontal, 20)
                    .padding(.top, 15.0)
                Spacer(minLength: 30)
//                Divider()
                Text("Have your friend's name and date of birth ready.")
                    //.font(Constants.buttonFont)
                    .font(.system(size: 18))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    //.padding(10.0)
                    .padding(.horizontal, 30)
                    .truncationMode(.head)
                    .padding(.bottom, 10.0)
                    .lineLimit(2)
                Text("Don't be afraid if the officer uses your name, they have caller ID.")
                    .font(.system(size: 18))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .padding(.bottom, 15)
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                Text("Hello, I'm inquiring about ________.")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 5.0)
                    .padding()
                    .lineLimit(1)
                Text("Their date of birth is ______.")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 5.0)
                    //.padding(.bottom, 40)
                    .lineLimit(1)
                Text("If the officer has no information, priceed to the next step.")
                    //.font(Constants.buttonFont)
                    .font(.system(size: 18))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .padding(.top, 15.0)
                    .padding(.horizontal, 30)
                    .truncationMode(.head)
                
                Text("Where have people who have been arrested been taken?")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 5.0)
                    .padding()
                    .lineLimit(2)
                Text("If the officer has no further information, go down the list of precincts and call each until you get an answer.")
                    //.font(Constants.buttonFont)
                    .font(.system(size: 18))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    //.padding(.top, 15.0)
                    .padding(.horizontal, 25)
                    .truncationMode(.head)
                Text("Apply pressure to precincts until you get answers!")
                    //.font(Constants.buttonFont)
                    .font(.system(size: 18))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .padding(.top, 15.0)
                    .padding(.horizontal, 25)
                    .truncationMode(.head)
            }
        }//.padding(.bottom, 30)
    }
}

struct CallGuideView_Previews: PreviewProvider {
    static var previews: some View {
        CallGuideView()
    }
}

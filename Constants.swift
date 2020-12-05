//
//  Constants.swift
//  blm
//
//  Created by Carlton Segbefia on 6/15/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI

enum Constants {
    static let textUIColor: UIColor =  UIColor.init(red: 53/255, green: 55/255, blue: 64/255, alpha: 1)
    static let backgroundUIColor: UIColor =  UIColor.init(red: 220/255, green: 229/255, blue: 232/255, alpha: 1)
    static let headingUIColor: UIColor = UIColor.init(red: 244/255, green: 84/255, blue: 46/255, alpha: 1)
    static let textColor: Color =  Color.init(red: 53/255, green: 55/255, blue: 64/255, opacity: 1)
    static let backgroundColor: Color =  Color.init(red: 220/255, green: 229/255, blue: 232/255, opacity: 1)
    static let headingColor: Color = Color.init(red: 244/255, green: 84/255, blue: 46/255, opacity: 1)
    static let headingFont: Font = Font.custom("BantoDemo-ExtraBold", size: 38)
    static let heading2Font: Font = Font.custom("BantoDemo-ExtraBold", size: 20)
    static let headingUIFont: UIFont = UIFont(name:"BantoDemo-ExtraBold", size: 28)!
    static let subHeadingFont: Font =        Font.custom("BantoDemo-ExtraLight", size: 28)
    static let h5: Font = Font.custom("BantoDemo-Regular", size: 32)
    static let textFont: Font = .body
    static let buttonFont: Font = Font.custom("BantoDemo-ExtraLight", size: 25)
    static let cardBackgroundColor: Color = Color.init(red: 240/255, green: 133/255, blue: 48/255, opacity: 0.11)
    
}



struct Constants_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

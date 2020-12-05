//
//  ProtestView.swift
//  blm
//
//  Created by Aabid Shamji on 6/7/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI
import WebKit
import SafariServices

struct ResourcesView: View {
    
    @State var showSafari = false
    @State var pageURL = "https://www.google.com/"
    var protestURL = "https://www.google.com/maps/d/u/0/viewer?ll=9.101946528762054%2C-54.84878109999998&z=2&mid=1W3fsF5-Mz3_KaBgVt2pU8BDY5GkawUN_"
    var findURL = "https://docs.google.com/spreadsheets/d/e/2PACX-1vR9ODS29XjvHjZLcrvjKwSivTsltyMQUK7evGBaJgQWaQu2pF81dCQiSHY4X6eNqcXycRBQ0f2MO_jl/pubhtml"
    var legalURL = "https://www.google.com/"
    var patiasURL = "http://pfw.guide/"

    
    var current_protests: some View {
        Button(action: {
            self.pageURL = self.protestURL
            self.showSafari = true
        }) {
            Text("Show Current Protests")
                .font(Constants.subHeadingFont)
                .foregroundColor(Constants.textColor)
        }
            // summon the Safari sheet
            .sheet(isPresented: $showSafari) {
                SafariView(url:URL(string: self.pageURL)!)
        }
    }
    
    var find_friend: some View {
        Button(action: {
            self.showSafari = true
            self.pageURL = self.findURL
        }) {
            Text("Find A Friend")
                .fontWeight(.bold)
                .font(Constants.buttonFont)
                .padding()
                .background(Constants.textColor)
                .foregroundColor(Constants.backgroundColor)
                .padding(10)
                .border(Constants.textColor, width: 5)
        }
            // summon the Safari sheet
            .sheet(isPresented: $showSafari) {
                SafariView(url:URL(string: self.pageURL)!)
        }
    }
    
    var get_legal_help: some View {
        Button(action: {
            self.showSafari = true
            self.pageURL = self.legalURL
        }) {
            Text("Contact a Lawyer")
                .fontWeight(.bold)
                .font(Constants.buttonFont)
                .padding()
                .background(Constants.textColor)
                .foregroundColor(Constants.backgroundColor)
                .padding(10)
                .border(Constants.textColor, width: 5)
        }
            // summon the Safari sheet
            .sheet(isPresented: $showSafari) {
                SafariView(url:URL(string: self.pageURL)!)
        }
    }
    
    var safety_info: some View{
        NavigationLink(destination: SafetyView() ){
            Text("Safety Info")
                .font(Constants.subHeadingFont)
                .foregroundColor(Constants.headingColor)
        }
    }
    
    var patias: some View{
        Button(
        action: {UIApplication.shared.open( URL(string: self.patiasURL)! )}){
            Text("Patia's Resource Guide")
                .font(Constants.subHeadingFont)
                .foregroundColor(Constants.headingColor)
        }
    }
    
    
    
    var zoes: some View{
        NavigationLink(destination: ZoesView() ){
            Text("Zoe's Black Radicalisms")
                .font(Constants.subHeadingFont)
                .foregroundColor(Constants.headingColor)
        }
    }
    
    var body: some View {
        ZStack{
            VStack(alignment: .center, spacing: 20) {
//                current_protests
                zoes
                Spacer()
                .frame(height: 10)
                patias
                Spacer()
                    .frame(height: 10)
                safety_info
            }.padding()
//            .navigationBarTitle(Text(""))
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        
    }
    
}

struct ProtestView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}

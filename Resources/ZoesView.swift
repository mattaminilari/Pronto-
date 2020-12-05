//
//  zoesView.swift
//  blm
//
//  Created by Carlton Segbefia on 7/24/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct Article: Identifiable, Equatable {
    let id = UUID()
    var name : String
    var url : URL?
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        return
            lhs.name == rhs.name &&
            lhs.url == rhs.url
    }
}

struct ZoesView: View {
    
    @State private var articles = [Article]()
    
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: Constants.headingUIColor, .font: Constants.headingUIFont]
    }
    
    
    
    func getData () {
        let storageRefEmpty = Storage.storage().reference(withPath: "Zoes' Black Radicalisms")
        
        
        storageRefEmpty.listAll { (result, error) in
            
            if let error = error {
                
                print(error)
                
            } else {
                
                for item in result.items {
                    
                    print(item.name as String)//////////
                    
                    var itemURL = URL(string: "")
                    item.downloadURL { (url, error) in
                        if let error = error {
                            print(error)
                        }
                        else {
                            itemURL = url
                            let article = Article(name: item.name as String, url: itemURL)
                            
                            if(!articles.contains(article)){
                                
                                self.articles.append(Article(name: item.name as String, url: itemURL))
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    
    var zoesURL = "https://gmail.us10.list-manage.com/subscribe?u=0b4aa9d3865ed2f250ba6aabc&id=c5da0bbd3e"
    
    var image: some View{
        GeometryReader { geometry in
            Image("zoes")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: 250)
                .clipped()
        }.frame(height:250, alignment: .center)
    }
    
    var text: some View{
        VStack{
            Text("Receive a short text in Black Radicalism everyday! We deliver theories and histories of Black Radicalism in short and digestible forms.\nTexts collected by Zoë Hopkins (@zoelhopkins), a Black femme from New York.")
                .font(Constants.textFont)
                .foregroundColor(Constants.textColor)
                .frame(minHeight:150)
                .padding()
            
            
            Button(
                action: {UIApplication.shared.open( URL(string: self.zoesURL)! )}){
                Text("Sign Up")
                    .frame(minWidth: 10)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(40)
            }
        }
    }
    
    var body: some View {
        ZStack{
//            Constants.backgroundColor.edgesIgnoringSafeArea(.all)
            //ScrollView {
            VStack{
                image
//                can't display text because the list can't be used with a scroll view. Probs need to make a seperate view for notificantions which can be gotten to from a button on this page
                text
                List(articles) { article in
                    NavigationLink(destination: ZoeDocumentView(url: article.url)) {
                        VStack(alignment: .leading) {
                            Text(article.name).font(Constants.textFont).foregroundColor(Constants.textColor).padding()
                        }
                    }
                }.padding()
                .listRowBackground(Color.white)
                .frame(minWidth: 400,
                       maxWidth: .infinity,
                       minHeight: 200,
                       maxHeight: 400
                )
                .onAppear(perform: getData)
                Spacer()
                //  }
            }
        }
        .navigationBarTitle("Black Radicalisms")
    }
}

struct zoesView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZoesView()
    }
}

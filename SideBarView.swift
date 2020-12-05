//
//  SideBar.swift
//  Pronto
//
//  Created by Carlton Segbefia on 10/25/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI

struct SideBarView<Content: View>: View {
    
    private var destinationView: Content
    var title :String
    //    Todo: add a prop for a title
    //    Todo: add a prop for backbutton???
    
    
    
    @State var showMenu = false
    
    
    init(destinationView: Content, _ title: String) {
        self.destinationView = destinationView
        self.title = title
    }
    
    
    var body: some View {
        
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -100 {
                    withAnimation {
                        self.showMenu = false
                    }
                }
            }
        
        
        
        return
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    destinationView
                    if self.showMenu {
                        MenuView()
                            .frame(width: geometry.size.width*0.67)
                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(drag)
                .navigationBarTitle(Text(title), displayMode: .inline)
                .navigationBarItems(leading: (
                    Button(action: {
                        withAnimation {
                            self.showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                ))
                .navigationBarBackButtonHidden(true)
            }
    }
}

struct MainView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.showMenu = true
            }
        }) {
            Text("Show Menu")
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView(destinationView: ResourcesView(), "Test")
    }
}

//
//  OrgDetailView.swift
//  blm
//
//  Created by Aabid Shamji on 6/8/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI
import MessageUI
import SafariServices

struct OrgDetailView: View {
    
    var org: Organisation
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    @State var showSafari = false
    @State var urlString = "https://www.google.com/"
    
    var image: some View{
        GeometryReader { geometry in
            Image("org_"+self.org.id)
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: 250)
                .clipped()
        }.frame(height:250, alignment: .center)
    }
    
    var facebook: some View {
        Button(action: {
            self.urlString = self.org.fb 
            self.showSafari = true
        }) {
            Image("facebook").resizable()
                .frame(width: 58.0, height: 58.0)
                .clipShape(Circle())
                .shadow(radius: 10)
        }.buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $showSafari) {
                SafariView(url:URL(string: self.urlString)!)
        }
    }
    
    var insta: some View {
        Button(action: {
            self.urlString = self.org.instagram 
            self.showSafari = true
        }) {
            Image("instagram").resizable()
                .frame(width: 58.0, height: 58.0)
                .clipShape(Circle())
                .shadow(radius: 10)
        }.buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $showSafari) {
                SafariView(url:URL(string: self.urlString)!)
        }
    }
    
    var twitter: some View {
        Button(action: {
            self.urlString = self.org.twitter 
            self.showSafari = true
        }) {
            Image("twitter").resizable()
                .frame(width: 58.0, height: 58.0)
                .clipShape(Circle())
                .shadow(radius: 10)
        }.buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $showSafari) {
                SafariView(url:URL(string: self.urlString)!)
        }
    }
    
    var social: some View {
        HStack {
            if org.fb != "" {
                facebook
            }
            if org.instagram != "" {
                insta
            }
            if org.twitter != "" {
                twitter
            }
        }
    }
    
    var call_email: some View {
        HStack {
            if org.phone_num != "" {
                Button(action: {
                    let tel = "tel://"
                    let formattedString = tel + self.org.phone_num
                    guard let url = URL(string: formattedString) else { return }
                    UIApplication.shared.open(url)
                }) {
                    HStack {
                        Image(systemName: "phone.fill")
                            .font(.headline)
                        Text("Call ")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(40)
                }
            }
            if org.email != "" {
                Button(action: {
                    self.isShowingMailView.toggle()
                }) {
                    HStack {
                        Image(systemName: "envelope.fill")
                            .font(.headline)
                        Text("Email ")
                            .fontWeight(.semibold)
                            .font(.subheadline)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.black)
                    .cornerRadius(40)
                }
                .disabled(!MFMailComposeViewController.canSendMail())
                .sheet(isPresented: $isShowingMailView) {
                    MailView(email: self.org.email , result: self.$result)
                }
            }
        }
        .padding([.leading, .trailing], 20)
    }
    
    var website: some View {
        Button(action: {
            self.urlString = self.org.org_link
            self.showSafari = true
        }) {
            HStack {
                Image(systemName: "house.fill")
                    .font(.headline)
                Text("Website")
                    .font(.headline)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.black)
            .cornerRadius(40)
        }
        .sheet(isPresented: $showSafari) {
            SafariView(url:URL(string: self.urlString)!)
        }
        .padding([.leading, .trailing], 20)
    }
    
    var donate: some View {
        Button(action: {
            self.urlString = self.org.donate_url 
            self.showSafari = true
        }) {
            HStack {
                Image(systemName: "creditcard.fill")
                    .font(.headline)
                Text("Donate")
                    .font(.headline)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(40)
        }
        .sheet(isPresented: $showSafari) {
            SafariView(url:URL(string: self.urlString)!)
        }
        .padding([.leading, .trailing], 20)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                image
                Text(org.description)
                    .font(.body)
                    .padding()
                Text(org.org_link)
                    .font(.headline)
                if(!org.org_link.isEmpty){
                    website
                }
                if(!org.donate_url.isEmpty){
                    donate
                }
                call_email
                social
            }
        }
        .navigationBarTitle(org.org_name)
    }
}

struct OrgDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrgDetailView(org: Organisation(id: "1", location: "NULL", org_name: "NULL", org_link: "NULL", description: "NULL", donate_url: "NULL", volunteer_contact: "NULL", action_url: "NULL", instagram: "ins", fb: "fb", twitter: "tw", email: "", phone_num: ""))
    }
}

struct MailView: UIViewControllerRepresentable {
    
    var email: String
    
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>, email: String) {
            _presentation = presentation
            _result = result
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController,
                                   didFinishWith result: MFMailComposeResult,
                                   error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation,
                           result: $result,
                           email: email)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.setToRecipients([email])
        vc.mailComposeDelegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController,
                                context: UIViewControllerRepresentableContext<MailView>) {
        
    }
}

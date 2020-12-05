//
//  ZoeDocumentView.swift
//  Pronto
//
//  Created by Elijah Retzlaff on 10/28/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import SwiftUI
import PDFKit

// This struct will return pdfView in UIView form to make it SwiftUI compatible
struct PDFViewUI : UIViewRepresentable {

    var url: URL?
    init(url : URL?) {
        self.url = url
    }

    func makeUIView(context: Context) -> UIView {
        let pdfView = PDFView()

        if let url = url {
            pdfView.document = PDFDocument(url: url)
        }

        return pdfView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    // Empty
    }

}

struct ZoeDocumentView: View {
    
    //var document: UIDocument
    //var dismiss: () -> Void
    var pdfView: PDFViewUI!

    
    init(url: URL?) {
        
        pdfView = PDFViewUI(url: url)

    }
    
    var body: some View {
        VStack {
            pdfView

            //Button("Done", action: dismiss)
        }
    }
    
}

struct ZoeDocumentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ZoeDocumentView(url: URL(string : "google.com"))
        
    }
}

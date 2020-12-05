//
//  MapViewCoordinator.swift
//  SwiftUI-MapView
//
//  Created by Anand Nimje on 12/12/19.
//  Copyright © 2019 Anand. All rights reserved.
//

import Foundation
import MapKit
import UIKit

/*
 Coordinator for using UIKit inside SwiftUI.
 */
class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
    var mapViewController: MapView
    
    init(_ control: MapView) {
        self.mapViewController = control
    }
    
    func mapView(_ mapView: MKMapView, viewFor
                    annotation: MKAnnotation) -> MKAnnotationView?{
        //Custom View for Annotation
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
        annotationView.canShowCallout = false
        //Your custom image icon
        let text = annotation.subtitle.unsafelyUnwrapped.unsafelyUnwrapped
        let text_length = text.count
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)
        ]

        UIGraphicsBeginImageContextWithOptions(CGSize(width: 48, height: 48), false, 0)

        let ctx = UIGraphicsGetCurrentContext()

        ctx!.setStrokeColor(UIColor.black.cgColor)
        ctx!.setFillColor(UIColor.black.cgColor)
        ctx!.setLineWidth(10)

        let rectangle = CGRect(x: 6, y: 7, width: 35, height: 35)
        ctx!.addEllipse(in: rectangle)
        ctx!.drawPath(using: .fillStroke)

        if text_length > 2 {
            text.draw(at: CGPoint(x: 5, y: 11.5), withAttributes: attributes)
        } else {
            if text_length > 1 {
                text.draw(at: CGPoint(x: 11.5, y: 11.5), withAttributes: attributes)
            } else {
                text.draw(at: CGPoint(x: 17, y: 11.5), withAttributes: attributes)
            }
        }
        
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        annotationView.image = image
//        UIImage(named: "locationPin"
        return annotationView
    }
    
    /// This is where the delegate gets the object for the selected annotation
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let v = view.annotation as? PrecinctAnnotation {
            mapViewController.showAnnnotation(annotation: v)
        } 
//        https://www.hackingwithswift.com/books/ios-swiftui/using-coordinators-to-manage-swiftui-view-controllers
    }
    
    
}

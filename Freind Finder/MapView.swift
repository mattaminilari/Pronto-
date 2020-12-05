//
//  MapView.swift
//  SwiftUI-MapView
//
//  Created by Anand Nimje on 17/10/19.
//  Copyright © 2019 Anand. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
    @Binding var annotation: PrecinctAnnotation?
    @Binding var showPopUp : Bool?
    
    let precincts = PrecinctAnnotation.getData()
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(self)
    }
    
    func showAnnnotation(annotation:PrecinctAnnotation){
        self.annotation = annotation
        self.showPopUp = true
    }
    
    /**
     - Description - Replace the body with a make UIView(context:) method that creates and return an empty MKMapView
     */
    func makeUIView(context: Context) ->
        MKMapView{
        let view = MKMapView(frame: .zero)
        let userLocation = precincts[0].coordinate
        let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
        view.setRegion(viewRegion, animated: false)
        view.delegate = context.coordinator
        view.addAnnotations(precincts)
        return view
    }
    
    func updateUIView(_ view: MKMapView, context: Context){
        //If you changing the Map Annotation then you have to remove old Annotations
        //mapView.removeAnnotations(mapView.annotations)
//        view.delegate = context.coordinator
//        view.addAnnotations(precincts)
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
////        MapView(annotation: PrecinctAnnotation.getData()[0])
//    }
//}

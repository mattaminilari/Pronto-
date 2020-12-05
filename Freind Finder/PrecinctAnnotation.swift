//
//  PrecintAnnotation.swift
//  Pronto
//
//  Created by Carlton Segbefia on 10/29/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import Foundation
import MapKit

class Precinct: Codable, Identifiable {
    var id:String
    var precinct_no: String
    var name: String
    var link: String
    var borough: String
    var telephone_1: String
    var address: String
    var location: String
    var type: String
    var latitudes: String
    var longitudes: String
}

class PrecinctAnnotation: NSObject, MKAnnotation {
    var id:Int?
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    let link: String?
    let borough: String?
    let telephone_1: String?
    let address: String?
    let city: String?
    let type: String?
    
    init(id:Int? = nil,
         title: String? = nil,
         subtitle: String? = nil,
         latitude: Double? = nil,
         longitude: Double? = nil,
         link: String? = nil,
         borough: String? = nil,
         telephone_1: String?  = nil,
         address: String? = nil,
         city: String? = nil,
         type: String? = nil) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.coordinate = CLLocationCoordinate2DMake(latitude ?? 0, longitude ?? 0)
        self.link = link
        self.borough = borough
        self.telephone_1 = telephone_1
        self.address = address
        self.city = city
        self.type = type
    }
    
    static func getData()-> [PrecinctAnnotation]{
        let userCity = UserDefaults.standard.string(forKey: "userCity")
        
        let precincts: [Precinct] = Bundle.main.decode(
            [Precinct].self,
            from: "precincts.json")
        
        var precinctsAnnotation: [PrecinctAnnotation] = []
        
        for precinct in precincts.filter({ $0.location == userCity}) {
            precinctsAnnotation.append(PrecinctAnnotation(id: Int(precinct.id), title: precinct.name, subtitle: precinct.precinct_no, latitude: Double(precinct.latitudes), longitude: Double(precinct.longitudes), link: precinct.link, borough: precinct.borough, telephone_1: precinct.telephone_1, address: precinct.address, city: precinct.location, type: precinct.type))
        }
        
        return precinctsAnnotation
        
    }
    
}

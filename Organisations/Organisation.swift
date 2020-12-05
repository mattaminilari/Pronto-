//
//  Organisation.swift
//  blm
//
//  Created by Aabid Shamji on 6/9/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import Foundation

struct Organisation: Codable, Identifiable {
    var id: String
    var location: String 
    var org_name: String
    var org_link: String
    var description: String
    var donate_url: String
    var volunteer_contact: String
    var action_url: String
    var instagram: String
    var fb: String
    var twitter: String
    var email: String
    var phone_num: String
}

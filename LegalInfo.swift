//
//  LegalInfo.swift
//  blm
//
//  Created by Carlton Segbefia on 6/16/20.
//  Copyright © 2020 APaul Hill. All rights reserved.

import Foundation
struct LegalInfo: Codable, Identifiable {
    var id: String
    var location: String
    var search: String
    var name: String
    var phone_num: String
    var bail: String
    var legal_form: String
}

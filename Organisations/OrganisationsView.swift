//
//  DonateView.swift
//  blm
//
//  Created by Aabid Shamji on 6/7/20.
//  Copyright © 2020 Paul Hill. All rights reserved.
//

import Foundation
import SwiftUI

struct OrganisationsView: View {
    
    init(){
        UITableView.appearance().backgroundColor = Constants.backgroundUIColor
        UITableViewCell.appearance().backgroundColor = Constants.backgroundUIColor
    }
    
    
    private var userCity = UserDefaults.standard.string(forKey: "userCity")
    
    private var organisations: [Organisation] = Bundle.main.decode(
        [Organisation].self,
        from: "orginfo.json")
    
    var body: some View {
        //filter out organisations which location matching the saved city
        
        List(organisations.filter{ $0.location == userCity}.sorted(by: sortOrganisationHelper))
        { org in
            NavigationLink(destination: OrgDetailView(org: org)) {
                Image("org_"+org.id)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .clipped()
                Text(org.org_name)
                    .foregroundColor(Constants.textColor)
            }
        }.listRowBackground(Constants.backgroundColor)
    }
    
    //    Helper  that takes two organisation and returns true if the name of the
    //first organisation is alphabetically before the name of the second
    //organisation.
    //Used to sort array of Organisations in descending order of name alphabetically
    func sortOrganisationHelper(this:Organisation, that:Organisation) -> Bool {
        return this.org_name < that.org_name
    }
}

struct DonateView_Previews: PreviewProvider {
    static var previews: some View {
        OrganisationsView()
    }
}



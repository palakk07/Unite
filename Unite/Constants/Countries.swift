//
//  Countries.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/29/23.
//

import Foundation

enum Countries: String, CaseIterable {
    case india = "India"
    case usa = "United States"
    
    var flgName: String {
        switch self {
        case .india: return "india"
        case .usa: return "usa"
        }
    }
    
    var states: [String] {
        switch self {
        case .india:
            return [
                "Andaman and Nicobar Islands",
                "Andhra Pradesh",
                "Arunachal Pradesh",
                "Assam",
                "Bihar",
                "Chandigarh",
                "Chhattisgarh",
                "Dadra and Nagar Haveli and Daman and Diu",
                "Goa",
                "Gujurat",
                "Haryana",
                "Himachal Pradesh",
                "Jammu and Kashmir",
                "Jharkhand",
                "Karnataka",
                "Kerela",
                "Ladakh",
                "Lakshadweep",
                "Madhya Pradesh",
                "Maharashtra",
                "Manipur",
                "Meghalaya",
                "Mizoram",
                "Nagaland",
                "NCT of Delhi",
                "Odisha",
                "Puducherry",
                "Punjab",
                "Rajasthan",
                "Sikkim",
                "Tamil Nadu",
                "Telangana",
                "Tripura",
                "Uttarakhand",
                "Uttar Pradesh",
                "West Bengal"
            ]
        case .usa:
            return ["Alaska", "Alabama", "Arkansas", "American Samoa", "Arizona", "California", "Colorado", "Connecticut", "District of Columbia", "Delaware", "Florida", "Georgia", "Guam", "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana", "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina", "North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Puerto Rico", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Virginia", "Virgin Islands", "Vermont", "Washington", "Wisconsin", "West Virginia", "Wyoming"]
        }
    }
}

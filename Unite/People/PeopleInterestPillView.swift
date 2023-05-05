//
//  PeopleInterestPillView.swift
//  Unite
//
//  Created by Pranav Bhandari on 3/24/23.
//

import SwiftUI

struct PeopleInterestPillView: View {
    let title: String
    var body: some View {
        HStack {
            Spacer().frame(width: 32)
            
            VStack {
                Spacer().frame(height: 16)
                
                Text(title)
                    .font(.system(size: 13, weight: .semibold))
                
                Spacer().frame(height: 16)
            }
            
            Spacer().frame(width: 32)
        }
        .cornerRadius(24)
    }
}

struct PeopleInterestPillView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleInterestPillView(title: "English")
    }
}

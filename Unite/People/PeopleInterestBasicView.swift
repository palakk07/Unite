//
//  PeopleInterestBasicView.swift
//  Unite
//
//  Created by Pranav Bhandari on 3/24/23.
//

import SwiftUI

struct PeopleInterestBasicView: View {
    let title: String
    let descriptionText: String
    
    var body: some View {
        HStack {
            Spacer().frame(width: 16)
            VStack {
                Spacer().frame(height: 8)
                
                HStack {
                    Text(title)
                        .foregroundColor(AppColors.gray)
                        .font(.system(size: 13))
                    
                    Spacer()
                }
                
                HStack {
                    Text(descriptionText)
                        .font(.system(size: 13, weight: .semibold))
                
                    Spacer()
                }
                
                Spacer().frame(height: 8)
            }
            .background(AppColors.lightPurple)
            .cornerRadius(12)
            
            Spacer().frame(width: 16)
        }
    }
}

struct PeopleInterestBasicView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleInterestBasicView(title: "Department", descriptionText: "Art and Education")
    }
}

//
//  CohortView.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/1/23.
//

import SwiftUI

struct CohortView: View {
    let user: User
    var body: some View {
        HStack(spacing: 10) {
            Image(user.imgName)
                .resizable()
                .frame(width: 50, height: 54)
                .cornerRadius(10)
                .padding(.leading, 10)
                .padding(.top, 8)
                .padding(.bottom, 8)
            
            VStack {
                HStack {
                    Text("\(user.firstName) \(user.lastName)")
                        .font(.custom("Poppins-Medium", size: 13))
                        .foregroundColor(.white)
                    Spacer()
                }
                
                HStack {
                    Text(user.joiningYear)
                        .font(.custom("Poppins-Regular", size: 12))
                        .foregroundColor(AppColors.blueTextColor)
                    
                    Spacer()
                }
            }
            
            Spacer()
        }
        .background(AppColors.interestsPrimaryColor)
    }
}

struct CohortView_Previews: PreviewProvider {
    static var previews: some View {
        CohortView(user: User(email: "test@test.com", firstName: "Palak", lastName: "Kothari", imgName: "palak", interests: ["Cycling", "Badminton", "Swimming", "Reading", "Painting", "DIY (Do-It-Yourself) projects", "Board/Card games", "Traveling", "Pottery"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021 Fall", languages: ["English", "Hindi"], country: "India", state: "Rajasthan", countryFlagName: "india"))
    }
}

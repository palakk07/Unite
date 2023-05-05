//
//  RecommendationView.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/1/23.
//

import SwiftUI

struct RecommendationView: View {
    let user: UserRecommendation
    var body: some View {
        HStack(spacing: 10) {
            Image(user.user.imgName)
                .resizable()
                .cornerRadius(10)
                .frame(width: 50, height: 54)
                .padding(.leading, 10)
                .padding(.top, 8)
                .padding(.bottom, 8)
            
            VStack {
                HStack {
                    Text("\(user.user.firstName) \(user.user.lastName)")
                        .font(.custom("Poppins-Medium", size: 13))
                        .foregroundColor(.white)
                    Spacer()
                }
                
                HStack {
                    Text("\(user.common) Mutual")
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

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView(user: UserRecommendation(user: User(email: "test@test.com", firstName: "Palak", lastName: "Kothari", imgName: "palak", interests: ["Cycling", "Badminton", "Swimming", "Reading", "Painting", "DIY (Do-It-Yourself) projects", "Board/Card games", "Traveling", "Pottery"], major: "M.A. Interaction Design and Interactive Art", department: "Letters, Arts and Social Sciences", joiningYear: "2021", languages: ["English", "Hindi"], country: "India", state: "Rajasthan", countryFlagName: "india"), common: 7))
    }
}

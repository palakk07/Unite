//
//  PeopleDetailCell.swift
//  Unite
//
//  Created by Pranav Bhandari on 3/24/23.
//

import SwiftUI

struct PeopleDetailCell: View {
    let model: UserRecommendation
    var body: some View {
        VStack {
            Spacer().frame(height: 8)
            
            HStack {
                Spacer().frame(width: 8)
                
                Image(model.user.imgName)
                    .resizable()
                    .frame(width: 48, height: 48)
                    .cornerRadius(12)
                
                Spacer().frame(width: 16)
                
                VStack {
                    HStack {
                        Text("\(model.user.firstName) \(model.user.lastName)")
                            .foregroundColor(.white)
                            .font(.custom("Poppins-Bold", size: 13))
                        Spacer()
                    }
                    
                    HStack {
                        Text("\(model.common)+ Common Interests")
                            .foregroundColor(AppColors.secondaryBlueColor)
                            .font(.custom("Poppins-Medium", size: 11))
                        
                        Spacer()
                    }
                }
                
                Spacer()
                
                Image(model.user.countryFlagName)
                    .resizable()
                    .frame(width: 24, height: 24)
                
                Spacer().frame(width: 8)
                
            }
            
            Spacer().frame(height: 16)
            
            HStack {
                Spacer().frame(width: 16)
                
                VStack(alignment: .leading) {
                    Text("Status")
                        .foregroundColor(AppColors.secondaryBlueColor)
                        .font(.custom("Poppins-Medium", size: 11))
                    
                    Text("Current")
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Medium", size: 13))
                }
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Major")
                        .foregroundColor(AppColors.secondaryBlueColor)
                        .font(.custom("Poppins-Medium", size: 11))
                    
                    Text(model.user.major)
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Medium", size: 13))
                }
                .padding(.trailing, 16)
                
                Spacer()
            }
            
            Spacer().frame(height: 8)
        }
        .frame(height: 136)
        .background(AppColors.interestsSecondaryColor)
    }
}

struct PeopleDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        PeopleDetailCell(model: UserRecommendation(user: User(email: "test@test.com", firstName: "Pranav", lastName: "Bhandari", imgName: "default_user", interests: ["Cricket"], major: "Masters in Computer Science", department: "Computer Science", joiningYear: "2015", languages: ["Hindi", "English"], country: "India", state: "Maharashtra    ", countryFlagName: "india"), common: 7))
    }
}

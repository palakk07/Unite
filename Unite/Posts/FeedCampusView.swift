//
//  FeedCampusView.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/5/23.
//

import SwiftUI

struct FeedCampusModel: Hashable {
    let imgName: String
    let hiring: String
    let time: String
    let by: String
    let role: String
    let position: String
}

struct FeedCampusView: View {
    let model: FeedCampusModel
    var body: some View {
            HStack {
                Image(model.imgName)
                    .resizable()
                    .frame(width: 86, height: 86)
                
                VStack {
                    HStack {
                        Text(model.hiring)
                            .font(.custom("Poppins-SemiBold", size: 13))
                        
                        Spacer()
                        
                        Text(model.time)
                            .foregroundColor(AppColors.blueTextColor)
                            .font(.custom("Poppins-Regular", size: 11))
                    }
                    
                    HStack {
                        Text(model.by)
                            .foregroundColor(AppColors.blueTextColor)
                            .font(.custom("Poppins-Medium", size: 11))
                        
                        Spacer()
                    }
                    
                    Spacer().frame(height: 16)
                    
                    HStack {
                        Text(model.role)
                            .foregroundColor(AppColors.blueTextColor)
                            .font(.custom("Poppins-Medium", size: 11))
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text(model.position)
                            .font(.custom("Poppins-SemiBold", size: 13))
                        
                        Spacer()
                    }
                }
            }
            .padding(.leading, 8)
            .padding(.trailing, 8)
            .padding(.top, 8)
            .padding(.bottom, 8)
            .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.interestsPrimaryColor)
    }
}

struct FeedCampusView_Previews: PreviewProvider {
    static var previews: some View {
        FeedCampusView(model: FeedCampusModel(imgName: "dummy_profile", hiring: "Hiring at ASI", time: "30", by: "By ASI", role: "Role", position: "Graphic Designer"))
    }
}

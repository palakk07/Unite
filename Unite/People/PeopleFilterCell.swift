//
//  PeopleFilterCell.swift
//  Unite
//
//  Created by Pranav Bhandari on 3/23/23.
//

import SwiftUI

struct PeopleFilterCell: View {
    let categoryName: String
    let categoryImgName: String
    var body: some View {
        VStack {
            Spacer().frame(height: 16)
            HStack {
                Spacer().frame(width: 8)
                Image(categoryImgName)
                    .resizable()
                    .frame(width: 48, height: 48)
                
                Spacer().frame(width: 16)
                
                Text(categoryName)
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Regular", size: 13))
                
                Spacer()
            }
            .cornerRadius(16)
            Spacer().frame(height: 16)
        }
        .cornerRadius(16)
        .background(AppColors.interestsSecondaryColor)
        .frame(maxWidth: .infinity, maxHeight: 80)
    }
}

struct PeopleFilterCell_Previews: PreviewProvider {
    static var previews: some View {
        PeopleFilterCell(categoryName: "Science", categoryImgName: "science")
    }
}

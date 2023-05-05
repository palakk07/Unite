//
//  InformationCell.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/30/23.
//

import SwiftUI

struct InformationCell: View {
    let item: String
    var body: some View {
        HStack {
            Spacer().frame(width: 24, height: 24)
            
            Text(item)
                .foregroundColor(.white)
                .font(.custom("Poppins-Medium", size: 13))
                .frame(height: 40, alignment: .leading)
            
            Spacer()
        }
        .contentShape(Rectangle())
        .frame(maxWidth: .infinity)
    }
}

struct InformationCell_Previews: PreviewProvider {
    static var previews: some View {
        InformationCell(item: "2023")
            .background(AppColors.interestsSecondaryColor)
    }
}

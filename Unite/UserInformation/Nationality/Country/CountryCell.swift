//
//  CountryCell.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/29/23.
//

import SwiftUI

struct CountryCell: View {
    @Binding var selectedCountry: String
    let country: Countries
    var body: some View {
        HStack {
            Spacer().frame(width: 24, height: 24)
            
            Text(country.rawValue)
                .foregroundColor(.white)
                .font(.custom("Poppins-Medium", size: 13))
                .frame(height: 40, alignment: .leading)
            
            Spacer()
        }
        .contentShape(Rectangle())
        .frame(maxWidth: .infinity)
    }
}

struct CountryCell_Previews: PreviewProvider {
    static var previews: some View {
        CountryCell(selectedCountry: .constant("India"), country: .india)
            .background(AppColors.interestsSecondaryColor)
    }
}

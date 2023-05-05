//
//  LanguageCell.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/29/23.
//

import SwiftUI

struct LanguageCell: View {
    @Binding var selectedLanguages: [String]
    let language: Languages
    @State var selected = false
    
    var body: some View {
        HStack {
            Image(selected ? "selected" : "")
                .resizable()
                .frame(width: 24, height: 24)
            
            Text(language.rawValue)
                .foregroundColor(.white)
                .font(.custom("Poppins-Medium", size: 13))
                .frame(height: 40, alignment: .leading)
            
            Spacer()
        }
        .contentShape(Rectangle())
        .frame(maxWidth: .infinity)
        .onTapGesture {
            selected.toggle()
            if selectedLanguages.contains(language.rawValue) {
                selectedLanguages.removeAll { $0 == language.rawValue }
            } else {
                selectedLanguages.append(language.rawValue)
            }
        }
    }
}

struct LanguageCell_Previews: PreviewProvider {
    static var previews: some View {
        LanguageCell(selectedLanguages: .constant([]), language: .hindi)
            .background(AppColors.interestsSecondaryColor)
    }
}

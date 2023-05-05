//
//  InterestsGridCell.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/28/23.
//

import SwiftUI

struct InterestsGridCell: View {
    @State private var selected = false
    var type: Interests

    var body: some View {
        HStack {
            VStack {
                Spacer().frame(height: 34)
                Image(type.imgName)
                    .resizable()
                    .frame(width: 25, height: 25)

                Spacer().frame(height: 34)
                
                VStack {
                    Spacer().frame(height: 8)
                    Text(type.rawValue)
                        .frame(width: 100)
                        .foregroundColor(Color.white)
                        .font(.system(size: 11))
                    Spacer().frame(height: 8)
                }
                .background(AppColors.interestsSecondaryColor)
            }
        }
        .background(selected ? AppColors.redColor : AppColors.interestsPrimaryColor)
        .onTapGesture {
            selected.toggle()
            if selected {
                UserData.shared.interests.append(type.rawValue)
            } else {
                UserData.shared.interests.removeAll { $0 == type.rawValue }
            }
        }
    }
}

struct InterestsGridCell_Previews: PreviewProvider {
    static var previews: some View {
        InterestsGridCell(type: .gaming)
            .frame(width: 100, height: 125)
    }
}

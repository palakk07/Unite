//
//  StudentStatusGridCell.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/30/23.
//

import SwiftUI

struct StudentStatusGridCell: View {
    var status: StudentStatus

    var body: some View {
        HStack {
            VStack {
                Spacer().frame(height: 34)
                Image(status.imgName)
                    .resizable()
                    .frame(width: 25, height: 25)

                Spacer().frame(height: 34)
                
                VStack {
                    Spacer().frame(height: 8)
                    Text(status.rawValue)
                        .frame(minWidth: 100)
                        .foregroundColor(Color.white)
                        .font(.system(size: 11))
                    Spacer().frame(height: 8)
                }
                .frame(maxWidth: .infinity)
                .background(AppColors.interestsSecondaryColor)
            }
        }
    }
}

struct StudentStatusGridCell_Previews: PreviewProvider {
    static var previews: some View {
        StudentStatusGridCell(status: .graduate)
    }
}

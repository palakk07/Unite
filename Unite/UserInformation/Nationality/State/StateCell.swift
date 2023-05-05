//
//  StateCell.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/29/23.
//

import SwiftUI

struct StateCell: View {
    @Binding var selectedState: String
    let state: String
    var body: some View {
        HStack {
            Spacer().frame(width: 24, height: 24)
            
            Text(state)
                .foregroundColor(.white)
                .font(.custom("Poppins-Medium", size: 13))
                .frame(height: 40, alignment: .leading)
            
            Spacer()
        }
        .contentShape(Rectangle())
        .frame(maxWidth: .infinity)
    }
}

struct StateCell_Previews: PreviewProvider {
    static var previews: some View {
        StateCell(selectedState: .constant(""), state: "Maharashtra")
    }
}

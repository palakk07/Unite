//
//  TabButton.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/5/23.
//

import SwiftUI

struct TabButton: View {
    var title: String
    var image: String
    
    @Binding var selected: String
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = title
            }
        }) {
            HStack(spacing: 10) {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 24, height: 24)
                    .foregroundColor(AppColors.redColor)
                
                if selected == title {
                    Text(title)
                        .font(.custom("Poppins-Medium", size: 13))
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(AppColors.tabRedColor.opacity(selected == title ? 0.8 : 0))
            .clipShape(Rectangle())
            .cornerRadius(10)
        }
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabButton(title: "Discover", image: "tab_discover", selected: .constant("Discover"))
    }
}

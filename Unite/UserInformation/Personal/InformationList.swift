//
//  InformationList.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/30/23.
//

import SwiftUI

struct InformationList: View {
    var title: String
    var searchPlaceholder: String
    var objects: [String]
    @State private var displayList = false
    @Binding var selectedItem: String
    var placeholder: String

    var body: some View {
        HStack {
            Spacer().frame(width: 8)
            
            VStack(alignment: .leading)  {
                Spacer().frame(height: 4)
                if selectedItem == "" {
                    Text(placeholder)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                        .foregroundColor(AppColors.blueTextColor)
                } else {
                    Text(selectedItem)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                        .foregroundColor(AppColors.blueTextColor)
                }
                
                Spacer().frame(height: 4)
            }
            
            Spacer()
            
            Triangle(.down, AppColors.blueTextColor)
                .frame(width: 21, height: 10)
                .padding(.trailing, 8)
            
            Spacer().frame(width: 8)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(AppColors.secondaryBackground)
        .cornerRadius(10.0)
        .shadow(radius: 4)
        .onTapGesture {
            displayList.toggle()
        }
        .sheet(isPresented: $displayList, content: {
            VStack {
                InformationSheet(title: title, searchPlaceholder: searchPlaceholder, objects: objects, selectedItem: $selectedItem)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(AppColors.secondaryBackground)
        })
    }
}

struct InformationList_Previews: PreviewProvider {
    static var previews: some View {
        InformationList(title: "Select Year",
                        searchPlaceholder: "Search for the year or select from the list",
                        objects: ["2020", "2021", "2022", "2023"],
                        selectedItem: .constant(""),
                        placeholder: "Select Year")
    }
}

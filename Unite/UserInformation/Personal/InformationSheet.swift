//
//  InformationSheet.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/30/23.
//

import SwiftUI

struct InformationSheet: View {
    var title: String
    var searchPlaceholder: String
    var objects: [String]
    @Binding var selectedItem: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.custom("Poppins-SemiBold", size: 15))
                    .foregroundColor(.white)
                    .padding(.leading, 8)
                Spacer()
            }
            .frame(height: 80)
            .background(AppColors.interestsPrimaryColor)
            
            VStack {
                HStack {
                    Image("search")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 15.5, height: 15.5)
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                    
                    Spacer().frame(width: 16)
                    
                    Text(searchPlaceholder)
                        .font(.custom("Poppins-Regular", size: 13))
                        .foregroundColor(AppColors.blueTextColor)
                        .padding(.trailing, 16)
                    
                    Spacer()
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(AppColors.interestsPrimaryColor)
                .cornerRadius(16)
                .padding(.leading, 8)
                .padding(.trailing, 8)
                
                
                Spacer().frame(height: 16)
                ScrollView {
                    ForEach(objects, id:\.self) { item in
                        InformationCell(item: item)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40, alignment: .leading)
                            .onTapGesture {
                                selectedItem = item
                                presentationMode.wrappedValue.dismiss()
                            }
                        
                        Rectangle()
                            .fill(AppColors.blueTextColor).opacity(0.3)
                            .frame(height: 1)
                            .edgesIgnoringSafeArea(.horizontal)
                    }
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                }
                
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct InformationSheet_Previews: PreviewProvider {
    static var previews: some View {
        InformationSheet(title: "Select Year",
                         searchPlaceholder: "Search for the year or select from the list",
                         objects: ["2020", "2021", "2022", "2023"],
                         selectedItem: .constant(""))
            .background(AppColors.interestsSecondaryColor)
    }
}

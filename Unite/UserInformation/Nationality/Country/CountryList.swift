//
//  CountryList.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/29/23.
//

import SwiftUI

struct CountryList: View {
    @State private var displayList = false
    @Binding var selectedCountry: String
    var body: some View {
        HStack {
            Spacer().frame(width: 8)
            
            VStack(alignment: .leading)  {
                Spacer().frame(height: 4)
                if selectedCountry == "" {
                    Text("Select Nationality")
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                        .foregroundColor(AppColors.blueTextColor)
                } else {
                    Text(selectedCountry)
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
                CountrySheet(selectedCountry: $selectedCountry)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(AppColors.secondaryBackground)
        })
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList(selectedCountry: .constant(""))
    }
}

//
//  CountrySheet.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/29/23.
//

import SwiftUI

struct CountrySheet: View {
    @Binding var selectedCountry: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Text("Select Country")
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
                    
                    Text("Search for country or select from list")
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
                    ForEach(Countries.allCases, id:\.self) { country in
                        //                        LanguageCell(selectedLanguages: $selectedLanguages, language: language, selected: selectedLanguages.contains(language.rawValue))
                        //                            .frame(maxWidth: .infinity)
                        //                            .frame(height: 40, alignment: .leading)
                        CountryCell(selectedCountry: $selectedCountry, country: country)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40, alignment: .leading)
                            .onTapGesture {
                                selectedCountry = country.rawValue
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

struct CountrySheet_Previews: PreviewProvider {
    static var previews: some View {
        CountrySheet(selectedCountry: .constant(""))
            .background(AppColors.interestsSecondaryColor)
    }
}

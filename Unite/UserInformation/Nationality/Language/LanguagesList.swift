//
//  LanguagesList.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/29/23.
//

import SwiftUI

struct LanguagesList: View {
    @State private var displayList = false
    @State var selectedLanguages = [String]()
    
    var body: some View {
        HStack {
            Spacer().frame(width: 8)
            
            VStack(alignment: .leading)  {
                Spacer().frame(height: 4)
                if selectedLanguages.count == 0 {
                    Text("Select languages")
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                        .foregroundColor(AppColors.blueTextColor)
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach (selectedLanguages, id:\.self) { language in
                                VStack {
                                    HStack {
                                        Spacer().frame(width: 4)
                                        Text(language)
                                            .foregroundColor(.black)
                                            .font(.custom("Poppins-Regular", size: 13))
                                        Spacer().frame(width: 8)
                                        Text("x")
                                            .font(.system(size: 10))
                                        Spacer().frame(width: 4)
                                    }
                                }
                                .frame(height: 32)
                                .background(AppColors.pillBackgroundColor)
                                .cornerRadius(6)
                                .onTapGesture {
                                    print("Cancelled")
                                    selectedLanguages.removeAll { $0 == language}
                                }
                                
                                Spacer().frame(width: 16)
                            }
                        }
                    }
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
                LanguageSheet(selectedLanguages: $selectedLanguages)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(AppColors.secondaryBackground)
        })
    }
}

struct LanguagesList_Previews: PreviewProvider {
    static var previews: some View {
        LanguagesList()
    }
}

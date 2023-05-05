//
//  StateList.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/29/23.
//

import SwiftUI

struct StateList: View {
    @State private var displayList = false
    @State var selectedState = ""
    @Binding var selectedCountry: Countries
    var body: some View {
        HStack {
            Spacer().frame(width: 8)
            
            VStack(alignment: .leading)  {
                Spacer().frame(height: 4)
                if selectedState == "" {
                    Text("Select State / Region")
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                        .foregroundColor(AppColors.blueTextColor)
                } else {
                    Text(selectedState)
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
                StateSheet(selectedState: $selectedState, selectedCountry: $selectedCountry)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(AppColors.secondaryBackground)
        })
    }
}

struct StateList_Previews: PreviewProvider {
    static var previews: some View {
        StateList(selectedCountry: .constant(.india))
    }
}

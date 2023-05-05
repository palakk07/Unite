//
//  PeopleDetailedView.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/4/23.
//

import SwiftUI

struct PeopleDetailedView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var searchText = ""
    let selectedMajor: Majors
    let viewModel: PeopleDetailedViewModel
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image("back")
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
        }
    }
    }
    
    var body: some View {
        VStack {
            HStack {
                
                Image("back")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
                Text("People")
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Bold", size: 17))
                    .padding(.trailing, 32)
                Spacer()
            }

            HStack {
                HStack {
                    Image("search")
                    
                    TextField("Search", text: $searchText, onEditingChanged: { isEditing in
                        //
                    }, onCommit: {
                        print("onCommit")
                    })
                    .foregroundColor(.white)
                    .placeholder(when: searchText.isEmpty) {
                        Text("Search")
                            .foregroundColor(AppColors.pillBackgroundColor)
                            .font(.custom("Poppins-Regular", size: 13))
                    }
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .frame(height: 50)
                .background(AppColors.interestsPrimaryColor)
                .foregroundColor(.white)
                .background(Color(.white))
                .cornerRadius(10.0)
                .shadow(radius: 4)
                
                Spacer().frame(width: 16)
                
                HStack {
                    Spacer().frame(width: 16)
                    Image("filter")
                        .renderingMode(.template)
                        .foregroundColor(.white)
                    Spacer().frame(width: 16)
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .frame(height: 50)
                .background(AppColors.interestsPrimaryColor)
                .cornerRadius(10.0)
                .shadow(radius: 4)
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
            
            Spacer().frame(height: 20)
            
            Text("Results for people in \(selectedMajor.rawValue) :")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.custom("Poppins-Regular", size: 13))
                .padding(.leading, 16)
                .padding(.trailing, 16)
            
            Spacer().frame(height: 20)
            
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.getFilteredUsers(), id:\.self) { user in
                    PeopleDetailCell(model: user)
                        .cornerRadius(12)
                }
            }
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.blackColor)
        .foregroundColor(.white)
        
        .navigationBarBackButtonHidden(true)
    }
}

struct PeopleDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleDetailedView(selectedMajor: .maInteractionDesignAndInteractiveArt, viewModel: PeopleDetailedViewModel(major: .maInteractionDesignAndInteractiveArt))
    }
}

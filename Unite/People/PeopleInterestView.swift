//
//  PeopleInterestView.swift
//  Unite
//
//  Created by Pranav Bhandari on 3/24/23.
//

import SwiftUI

struct PeopleInterestView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let model: PeopleDetailModel
    private let adaptiveColumns = [
        //        GridItem(.adaptive(minimum: 48)),
        //        GridItem(.adaptive(minimum: 48)),
        //        GridItem(.adaptive(minimum: 48))
        GridItem(.adaptive(minimum: 100, maximum: 250)),
        GridItem(.adaptive(minimum: 100, maximum: 250)),
        GridItem(.adaptive(minimum: 100, maximum: 250))
    ]
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image("back") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
        }
    }
    }
    
    var chatBtn: some View {
        HStack {
            Spacer().frame(width: 16)
            Text("Chat")
                .foregroundColor(.white)
                .font(.system(size: 13, weight: .semibold))
            Spacer().frame(width: 16)
        }
        .frame(height: 30)
        .background(AppColors.purple)
        .cornerRadius(4)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Spacer()
                    
                    Image(model.imgName)
                        .resizable()
                        .frame(width: 124, height: 124)
                    
                    Spacer()
                }
                
                Spacer().frame(height: 48)
                
                HStack {
                    Spacer().frame(width: 16)
                    Text("Profile Details :")
                        .foregroundColor(AppColors.purple)
                        .font(.system(size: 15, weight: .semibold))
                    Spacer()
                }
                
                Spacer().frame(height: 4)
                
                VStack {
                    
                    PeopleInterestBasicView(title: "Department", descriptionText: model.department)
                        .cornerRadius(12)
                    
                    Spacer().frame(height: 8)
                    
                    
                    PeopleInterestBasicView(title: "Major", descriptionText: model.major)
                        .cornerRadius(12)
                    
                    Spacer().frame(height: 8)
                    
                    PeopleInterestBasicView(title: "Year and Semester", descriptionText: "\(model.year) year, \(model.semester)")
                        .cornerRadius(12)
                    
                    Spacer().frame(height: 8)
                    PeopleInterestBasicView(title: "Country", descriptionText: model.country)
                        .cornerRadius(12)
                    
                    Spacer().frame(height: 16)
                }
                
                HStack {
                    Spacer().frame(width: 16)
                    Text("Languages :")
                        .foregroundColor(AppColors.purple)
                        .font(.system(size: 15, weight: .semibold))
                    Spacer()
                }
                
                VStack {
                    
                    Spacer().frame(height: 4)
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns) {
                            ForEach(model.languages, id: \.self) { value in
                                PeopleInterestPillView(title: value)
                                    .frame(maxHeight: .infinity)
                                    .background(Profile.profile.languages.contains(value) ? .black : AppColors.lightPurple)
                                    .foregroundColor(Profile.profile.languages.contains(value) ? .white : .black)
                                    .cornerRadius(24)
                            }
                        }
                    }
                }
                
                VStack {
                    Spacer().frame(height: 16)

                    HStack {
                        Spacer().frame(width: 16)
                        Text("Sports :")
                            .foregroundColor(AppColors.purple)
                            .font(.system(size: 15, weight: .semibold))
                        Spacer()
                    }
                    
                    Spacer().frame(height: 4)
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns) {
                            ForEach(model.sports, id: \.self) { value in
                                PeopleInterestPillView(title: value)
                                    .frame(maxHeight: .infinity)
                                    .background(Profile.profile.sports.contains(value) ? .black : AppColors.lightPurple)
                                    .foregroundColor(Profile.profile.sports.contains(value) ? .white : .black)
                                    .cornerRadius(24)
                            }
                        }
                    }
                }
                
                VStack {
                    Spacer().frame(height: 16)
                    
                    HStack {
                        Spacer().frame(width: 16)
                        Text("Interests :")
                            .foregroundColor(AppColors.purple)
                            .font(.system(size: 15, weight: .semibold))
                        Spacer()
                    }
                    
                    Spacer().frame(height: 4)
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns) {
                            ForEach(model.interests, id: \.self) { value in
                                PeopleInterestPillView(title: value)
                                    .frame(maxHeight: .infinity)
                                    .background(Profile.profile.interests.contains(value) ? .black : AppColors.lightPurple)
                                    .foregroundColor(Profile.profile.interests.contains(value) ? .white : .black)
                                    .cornerRadius(24)
                            }
                        }
                    }
                    
                    Spacer().frame(height: 50)
                }
                
                Spacer()
                
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: btnBack, trailing: chatBtn)
                    .navigationBarTitle(model.name, displayMode: .inline)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct PeopleInterestView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleInterestView(model: PeopleDetailModel(name: "Alisson Arthur", imgName: "a1", commonInterest: "3+ Common Interests", countryFlagImgName: "usa", status: "Current", major: "B.A. Anthropology", year: "1st", department: "Art and Education", country: "United States of America", semester: "2nd Semester", languages: ["English", "German", "Spanish"], sports: ["Cricket", "Football", "Squash"], interests: ["Music", "Dance", "Painting", "Singing", "Shopping"]))
    }
}

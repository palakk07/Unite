//
//  SecondProfileView.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/19/23.
//

import SwiftUI

struct SecondProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var languages = ""
    @State private var loginButtonTapped = false
    @State private var progressValue = 30.0
    @State var displayNationality = false
    @State var selectedCountry = ""
    
    @State var displayState = false
    @State var state = "Select State / Region"
    
    var body: some View {
        VStack {
            NavigationLink(destination: ThirdProfileView(), isActive: $loginButtonTapped) {
                EmptyView()
            }
            
            HStack {
                
                Image("back")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
                Text("Create your Profile")
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Bold", size: 17))
                    .padding(.trailing, 32)
                Spacer()
            }
            
            
            VStack {
                HStack {
                    Text("Profile Status")
                        .font(.custom("Poppins-Bold", size: 14))
                    
                    Spacer()
                    
                    Text("30%")
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(Color(red: 200/255.0, green: 206/255.0, blue: 227/255.0))
                }
                
                ProgressView("", value: progressValue, total: 100)
                    .accentColor(AppColors.progressBarAccent)
                
                Spacer().frame(height: 24)
                
                Text("As CSUEB has diverse nationalities, we aim to help you find a language-matching local for a comfortable conversation.")
                    .font(.custom("Poppins-Regular", size: 13))
                    .foregroundColor(AppColors.blueTextColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack {
                Spacer().frame(height: 56)
                
                Image("secondProfile")
                    .resizable()
                    .frame(width: 125, height: 110)
            }
            
            VStack {
                Spacer().frame(height: 68)
                
                Text("Nationality")
                    .font(.custom("Poppins-Medium", size: 13))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CountryList(selectedCountry: $selectedCountry)
            }
            
            VStack {
                Spacer().frame(height: 16)
                
                Text("State / Region")
                    .font(.custom("Poppins-Medium", size: 13))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .zIndex(50)
                
                StateList(selectedCountry: .constant(Countries(rawValue: selectedCountry) ?? .india))
            }
            
            VStack {
                Spacer().frame(height: 16)
                
                Text("Languages Known")
                    .font(.custom("Poppins-Medium", size: 13))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LanguagesList()
            }
            
            Spacer()
            
            VStack {
                Spacer()
                
                Button(action: {}, label: {
                    Text("Next")
                        .font(.custom("Poppins-SemiBold", size: 15))
                        .frame(maxWidth: .infinity)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                })
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(
                    LinearGradient(
                        gradient: .init(colors: [Color(red: 195/255.0, green: 41/255.0, blue: 57/255.0),
                                                 Color(red: 160/255.0, green: 42/255.0, blue: 54/255.0)]),
                        startPoint: .init(x: -0.33, y: -0.33),
                        endPoint: .init(x: 0.66, y: 0.66)
                    ))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .buttonStyle(PlainButtonStyle())
                .onTapGesture {
                    loginButtonTapped.toggle()
                    UserData.shared.languages = ["English", "Hindi"]
                    UserData.shared.country = selectedCountry
                    UserData.shared.state = "Rajasthan"
                }
                
                Spacer().frame(height: 48)
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .foregroundColor(.white)
        .ignoresSafeArea(edges: .bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.blackColor)
        
        .navigationBarBackButtonHidden(true)
//        .navigationTitle("Create your Profile")
//        .navigationBarColor(backgroundColor: .clear, titleColor: .white)
    }
}

struct SecondProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SecondProfileView()
    }
}

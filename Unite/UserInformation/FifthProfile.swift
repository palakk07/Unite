//
//  FifthProfile.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/19/23.
//

import SwiftUI

struct FifthProfile: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var loginButtonTapped = false
    @State private var mentorshipOn = false
    @State private var progressValue = 90.0
    
    @State private var needMentor = false
    @State private var becomeMentor = false
    
    var body: some View {
        VStack {
            NavigationLink(destination: ContentView(), isActive: $loginButtonTapped) {
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
                    
                    Text("90%")
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(Color(red: 200/255.0, green: 206/255.0, blue: 227/255.0))
                }
                
                ProgressView("", value: progressValue, total: 100)
                    .accentColor(AppColors.progressBarAccent)
                
                Spacer().frame(height: 24)
                
                Text("You’re almost there! Just one click away from connecting with CSUEB students.")
                    .font(.custom("Poppins-Regular", size: 13))
                    .foregroundColor(AppColors.blueTextColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack {
                Spacer().frame(height: 76)
                
                Image("fifthProfile")
                    .resizable()
                    .frame(width: 204, height: 105)
            }
            
            Spacer().frame(height: 62)
            
            Text("Select all the options applicable for mentorship:")
                .font(.custom("Poppins-Medium", size: 13))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer().frame(height: 16)
            
            HStack {
                StudentStatusGridCell(status: .needMentor)
                
                    .background(needMentor ? AppColors.redColor : AppColors.interestsPrimaryColor)
                    .frame(maxWidth: .infinity, maxHeight: 125)
                    .cornerRadius(16)
                    .onTapGesture {
                        needMentor.toggle()
                        becomeMentor = false
                    }
                
                StudentStatusGridCell(status: .becomeMentor)
                    .background(becomeMentor ? AppColors.redColor : AppColors.interestsPrimaryColor)
                    .frame(maxWidth: .infinity, maxHeight: 125)
                    .cornerRadius(16)
                    .onTapGesture {
                        becomeMentor.toggle()
                        needMentor = false
                    }
            }
            VStack {
                Text("Mentorship is a program to help students at the university with campus tours, advice, guidance.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(AppColors.blueTextColor)
                    .font(.custom("Poppins-Regular", size: 13))
                
                Spacer().frame(height: 24)
                
                HStack {
                    Text("Note:")
                        .font(.custom("Poppins-Regular", size: 13))
                        .foregroundColor(AppColors.redColor)
                        .padding(.bottom)
                    
                    Text("Students who have spent minimum of one year at CSUEB are encouraged to be mentors.")
                        .font(.custom("Poppins-Regular", size: 13))
                }
            }
            
            VStack {
                Spacer()
                
                Button(action: {}, label: {
                    Text("Let’s Connect")
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
                    UserData.shared.saveUser()
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

struct FifthProfile_Previews: PreviewProvider {
    static var previews: some View {
        FifthProfile()
    }
}

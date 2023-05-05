//
//  ThirdProfileView.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/19/23.
//

import SwiftUI

struct ThirdProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var nationality = ""
    @State private var languages = ""
    @State private var loginButtonTapped = false
    @State private var progressValue = 45.0
    
    private let types: [Interests] = [
        .running,
        .weightLifting,
        .swimming,
        .boxing,
        .tableTennis,
        .basketBall,
        .badminton,
        .golf,
        .bowling,
        .horseRiding,
        .other,
    ]
    
    var body: some View {
        ZStack {
        VStack {
            NavigationLink(destination: FourthProfileView(), isActive: $loginButtonTapped) {
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
                    
                    Text("45%")
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(Color(red: 200/255.0, green: 206/255.0, blue: 227/255.0))
                }
                
                ProgressView("", value: progressValue, total: 100)
                    .accentColor(AppColors.progressBarAccent)
                
                Spacer().frame(height: 24)
                
                Text("Sports is a language in itself and one shared by many.")
                    .font(.custom("Poppins-Regular", size: 13))
                    .foregroundColor(AppColors.blueTextColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            ScrollView(.vertical) {
                VStack {
                    Spacer().frame(height: 76)
                    
                    Image("thirdProfile")
                        .resizable()
                        .frame(width: 158, height: 105)
                }

                VStack {
                    Spacer().frame(height: 85)
                    
                    Text("Select the activities you are interested in :")
                        .font(.custom("Poppins-Medium", size: 13))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    let gridItems = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ForEach(types, id: \.self) { interestType in
                            InterestsGridCell(type: interestType)
                                .frame(width: 100, height: 125)
                                .cornerRadius(16)
                        }
                    }
                }
                .padding(.bottom, 16)
            }
            .frame(maxHeight: .infinity)
            
            VStack {
                
                VStack {
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
                    }
                    
                    Spacer().frame(height: 48)
                }
                .background(AppColors.blackColor)
            }
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

struct ThirdProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdProfileView()
    }
}

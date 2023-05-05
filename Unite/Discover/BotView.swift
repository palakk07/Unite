//
//  BotView.swift
//  Unite
//
//  Created by Pranav Bhandari on 3/21/23.
//

import SwiftUI

struct BotView: View {
    private let viewModel = DiscoverViewModel()
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Discover")
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Bold", size: 17))
                Spacer()
                Image("dummy_profile")
                    .resizable()
                    .frame(width: 34, height: 34)
            }
            
            VStack {
                Text("\(UserData.shared.firstName),")
                    .font(.custom("Poppins-Bold", size: 24))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer().frame(height: 12)
                
                Text("Start discovering and building meaningful connections at CSUEB.")
                    .font(.custom("Poppins-Regular", size: 13))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer().frame(height: 30)
            }
            
            HStack {
                Image("search")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 15.5, height: 15.5)
                    .foregroundColor(.white)
                    .padding(.leading, 16)
                
                Spacer().frame(width: 16)
                
                Text("Search for people at CSUEB")
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
            
            ScrollView {
                VStack {
                    Spacer().frame(height: 32)
                    
                    HStack {
                        Text("Your Cohort :")
                            .font(.custom("Poppins-Medium", size: 13))
                        
                        Spacer()
                        
                        Text("View All >")
                            .foregroundColor(AppColors.redColor)
                            .font(.custom("Poppins-Bold", size: 13))
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewModel.getCohorts(), id:\.self) { user in
                                CohortView(user: user)
                                    .cornerRadius(16)
                                
                                Spacer().frame(width: 8)
                            }
                        }
                        .frame(height: 70)
                    }
                    
                    Spacer().frame(height: 30)
                    
                    HStack {
                        Text("Top 10 mutual recommendations :")
                            .font(.custom("Poppins-Medium", size: 13))
                        
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewModel.getRecommendations(), id:\.self) { user in
                                RecommendationView(user: user)
                                    .cornerRadius(16)
                                
                                Spacer().frame(width: 8)
                            }
                        }
                        .frame(height: 70)
                    }
                    
                    Spacer().frame(height: 30)
                    
                    HStack {
                        Text("People interested in your activities :")
                            .font(.custom("Poppins-Medium", size: 13))
                        
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewModel.groups, id:\.self) { group in
//                                GroupView(group: group)
//                                    .cornerRadius(16)
//                                    .frame(width: 172, height: 341)
                                ZStack {
                                    Image(group.imgName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: .infinity,
                                               maxHeight: .infinity)
                                    
                                    VStack {
                                        Spacer()
                                        
                                        HStack {
                                            Text(group.memberCount)
                                                .font(.custom("Poppins-Light", size: 48))
                                                Spacer()
                                        }
                                        
                                        HStack {
                                            Text(group.groupName)
                                                .font(.custom("Poppins-Bold", size: 17))
                                                Spacer()
                                        }
                                        
                                        Spacer().frame(height: 64)
                                    }
                                    .padding(.leading, 32)
                                    .foregroundColor(.white)
                                }
                                .frame(width: 172, height: 341)
                            }
                        }
                        .frame(height: 350)
                    }
                    
                    Spacer().frame(height: 48)
                }
            }
            
            Spacer()
        }
        .padding(.leading, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.blackColor)
        .foregroundColor(.white)
        
        .navigationBarItems(trailing:
                                Image("dummy_profile")
                                    .resizable()
                                    .frame(width: 32, height: 32))
    }
}

struct BotView_Previews: PreviewProvider {
    static var previews: some View {
        BotView()
    }
}

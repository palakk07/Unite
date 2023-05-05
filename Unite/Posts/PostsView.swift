//
//  PostsView.swift
//  Unite
//
//  Created by Pranav Bhandari on 3/21/23.
//

import SwiftUI

struct PostsView: View {
    @State private var buttonTapped = false

    var body: some View {
        VStack {
            NavigationLink(destination: FeedView(), isActive: $buttonTapped) {
                EmptyView()
            }

            HStack {
                Spacer()
                Text("Feed")
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Bold", size: 17))
                Spacer()
            }
            
            VStack {
                Spacer().frame(height: 37)
                
                Text("Select the category of feed you like to see :")
                    .font(.custom("Poppins-Medium", size: 13))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    VStack {
                        ZStack {
                            Image("feed_campus")
                                .resizable()
                                .frame(height: 279)
                                .onTapGesture {
                                    buttonTapped.toggle()
                                }
                            
                            Text("Campus Jobs")
                                .font(.custom("Poppins-Bold", size: 17))
                        }
                        
                        ZStack {
                            Image("feed_events")
                                .resizable()
                                .frame(height: 114)
                            
                            Text("Events")
                                .font(.custom("Poppins-Bold", size: 17))
                        }
                    }
                    
                    VStack {
                        ZStack {
                            Image("feed_housing")
                                .resizable()
                                .frame(height: 193)
                            
                            Text("Housing")
                                .font(.custom("Poppins-Bold", size: 17))
                        }
                        
                        ZStack {
                            Image("feed_activities")
                                .resizable()
                                .frame(height: 200)
                            
                            Text("Activities")
                                .font(.custom("Poppins-Bold", size: 17))
                        }
                    }
                }
                
                ZStack {
                    Image("feed_car")
                        .resizable()
                        .frame(height: 114)
                    
                    Text("Car Pooling")
                        .font(.custom("Poppins-Bold", size: 17))
                }
                
                Spacer()
            }
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.blackColor)
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}

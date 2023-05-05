//
//  FeedHousingView.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/5/23.
//

import SwiftUI

struct FeedHousingModel: Hashable {
    let imgName: String
    let title: String
    let time: String
    let by: String
    let price: String
    let rooms: String
    let location: String
}

struct FeedHousingView: View {
    let model: FeedHousingModel
    var body: some View {
        HStack {
            Image(model.imgName)
                .resizable()
                .frame(width: 86, height: 86)
            
            VStack {
                HStack {
                    Text(model.title)
                        .font(.custom("Poppins-SemiBold", size: 13))
                    
                    Spacer()
                    
                    Text(model.time)
                        .foregroundColor(AppColors.blueTextColor)
                        .font(.custom("Poppins-Regular", size: 11))
                }
                
                HStack {
                    Text(model.by)
                        .foregroundColor(AppColors.blueTextColor)
                        .font(.custom("Poppins-Medium", size: 11))
                    
                    Spacer()
                }
                
                Spacer().frame(height: 16)
                HStack {
                    VStack {
                        HStack {
                            Text("Price")
                                .foregroundColor(AppColors.blueTextColor)
                                .font(.custom("Poppins-Medium", size: 11))
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text(model.price)
                                .font(.custom("Poppins-SemiBold", size: 13))
                            
                            Spacer()
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Rooms")
                                .foregroundColor(AppColors.blueTextColor)
                                .font(.custom("Poppins-Medium", size: 11))
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text(model.rooms)
                                .font(.custom("Poppins-SemiBold", size: 13))
                            
                            Spacer()
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Location")
                                .foregroundColor(AppColors.blueTextColor)
                                .font(.custom("Poppins-Medium", size: 11))
                            
                            Spacer()
                        }
                        
                        HStack {
                            Text(model.location)
                                .font(.custom("Poppins-SemiBold", size: 13))
                            
                            Spacer()
                        }
                    }
                }
            }
        }
        .padding(.leading, 8)
        .padding(.trailing, 8)
        .padding(.top, 8)
        .padding(.bottom, 8)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.interestsPrimaryColor)
    }
}

struct FeedHousingView_Previews: PreviewProvider {
    static var previews: some View {
        FeedHousingView(model: FeedHousingModel(imgName: "feed_housing_list", title: "House in San Jose for re..", time: "1d", by: "By Palak Kothari", price: "$550", rooms: "2bhk", location: "San Jose"))
    }
}

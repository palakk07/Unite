//
//  FeedView.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/5/23.
//

import SwiftUI

struct FeedView: View {
    @Environment(\.presentationMode) var presentationMode
    private var feedItems = ["Campus Jobs", "Housing", "Events", "Activities", "Car Pooling"]
    @State var searchText = ""
    @State var selectedFeedItem = "Campus Jobs"
    
    private var campusData: [FeedCampusModel] = [
        FeedCampusModel(imgName: "campus1", hiring: "Hiring at ASI", time: "30 mins", by: "By ASI", role: "Role", position: "Graphic Designer"),
        FeedCampusModel(imgName: "campus2", hiring: "Open Positions for 5", time: "50 mins", by: "By Dinning Commons", role: "Role", position: "Front Runners"),
        FeedCampusModel(imgName: "campus1", hiring: "Photographer required", time: "1d", by: "By ASI", role: "Role", position: "Photographer / Web Developer")
    ]
    
    private var housingData: [FeedHousingModel] = [
        FeedHousingModel(imgName: "feed_housing_list", title: "House in San Jose for re..", time: "1d", by: "By Palak Kothari", price: "$550", rooms: "3bhk", location: "San Jose"),
        FeedHousingModel(imgName: "feed_housing_list", title: "Looking for a roommate", time: "1d", by: "By Khadija", price: "$500", rooms: "2bhk", location: "Hayward")
    ]
    
    
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
                Text("Feed")
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Bold", size: 17))
                    .padding(.trailing, 32)
                Spacer()
            }
            
            VStack {
                Spacer().frame(height: 40)
                
                HStack {
                    ScrollView(.horizontal) {
                        HStack(spacing: 16) {
                            ForEach(feedItems, id: \.self) { item in
                                Text(item)
                                    .frame(height: 38)
                                    .padding(.leading, 16)
                                    .padding(.trailing, 16)
                                    .foregroundColor(AppColors.blueTextColor)
                                    .font(.custom("Poppins-Medium", size: 15))
                                    .background(selectedFeedItem == item ? AppColors.redColor : AppColors.blackColor)
                                    .onTapGesture {
                                        selectedFeedItem = item
                                    }
                                    .cornerRadius(19)
                            }
                        }
                    }
                }
                
                Spacer().frame(height: 24)
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
            
            Spacer().frame(height: 16)
            
            ScrollView {
                if selectedFeedItem == "Campus Jobs" {
                    ForEach(campusData, id: \.self) { data in
                        FeedCampusView(model: data)
                            .cornerRadius(12)
                    }
                } else if selectedFeedItem == "Housing" {
                    ForEach(housingData, id: \.self) { data in
                        FeedHousingView(model: data)
                            .cornerRadius(12)
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.blackColor)
        
        .navigationBarBackButtonHidden(true)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

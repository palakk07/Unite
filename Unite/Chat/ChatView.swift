//
//  ChatView.swift
//  Unite
//
//  Created by Pranav Bhandari on 3/21/23.
//

import SwiftUI

struct ChatView: View {
    var data: [MessageModel] = [
        MessageModel(imgName: "message_view", title: "MM 602 - Project and Story Dev..", time: "1 hr", message: "Do we have class today?", status: "unread"),
        MessageModel(imgName: "message_view", title: "MM 665 - Experiments in Intera..", time: "6 hr", message: "I had a doubt about project", status: "read"),
        MessageModel(imgName: "message_view", title: "MM 693 - Interaction Design Cap..", time: "1 d", message: "Okay!!", status: "read")
    ]
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("People")
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Bold", size: 17))
                    .padding(.leading, 16)
                Spacer()
                
                Text("ADD")
                    .foregroundColor(AppColors.redColor)
                    .font(.custom("Poppins-Bold", size: 15))
            }
            
            Spacer().frame(height: 37)
            
            HStack {
                VStack {
                    Text("Chats")
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(.white)
                    
                    Rectangle()
                        .frame(height: 5)
                        .foregroundColor(AppColors.redColor)
                }
                
                VStack {
                    Text("Groups")
                        .font(.custom("Poppins-Regular", size: 14))
                        .foregroundColor(AppColors.pillBackgroundColor)
                    
                    Rectangle()
                        .frame(height: 5)
                        .foregroundColor(AppColors.blackColor)
                }
            }
            
            Spacer().frame(height: 20)
            
            ScrollView {
                ForEach(data, id: \.self) {item in
                    MessageView(model: item)
                        .cornerRadius(12)
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.leading, 8)
        .padding(.trailing, 8)
        .background(AppColors.blackColor)
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

//
//  MessageView.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/5/23.
//

import SwiftUI

struct MessageModel: Hashable {
    let imgName: String
    let title: String
    let time: String
    let message: String
    let status: String
}

struct MessageView: View {
    let model: MessageModel

    var body: some View {
        HStack {
            Image(model.imgName)
                .resizable()
                .frame(width: 48, height: 48)
            
            VStack {
                HStack {
                    Text(model.title)
                        .font(.custom("Poppins-SemiBold", size: 13))
                    
                    Spacer()
                    
                    Text(model.time)
                        .foregroundColor(AppColors.blueTextColor)
                        .font(.custom("Poppins-Regular", size: 11))
                }
                
                Spacer().frame(height: 10)
                
                HStack {
                    Text(model.message)
                        .font(.custom("Poppins-Regular", size: 13))
                        .foregroundColor(model.status == "unread" ? AppColors.blueTextColor : AppColors.pillBackgroundColor)
                    
                    Spacer()
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

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(model: MessageModel(imgName: "message_view", title: "MM 602 - Project and Story Dev..", time: "1 hr", message: "Do we have class today?", status: "unread"))
    }
}

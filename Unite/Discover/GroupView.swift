//
//  GroupView.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/2/23.
//

import SwiftUI

struct GroupView: View {
    let group: Groups
    var body: some View {
        ZStack {
            Image(group.imgName)
                .resizable()
//                .ignoresSafeArea()
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: UIScreen.main.bounds.width,
                       maxHeight: UIScreen.main.bounds.height)
            
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
        .ignoresSafeArea()
        //        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView(group: Groups(groupName: "Badminton", memberCount: "7", imgName: "discover_badminton"))
    }
}

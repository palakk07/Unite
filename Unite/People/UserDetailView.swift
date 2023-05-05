//
//  UserDetailView.swift
//  Unite
//
//  Created by Pranav Bhandari on 5/5/23.
//

import SwiftUI

struct UserDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image("back")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                }
                .padding(.top, 64)
                .padding(.leading, 8)
                
                Image("college")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 220)
                
                Spacer()
            }
            
            VStack {
                Text("Hi")
                    .foregroundColor(.white)
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.blackColor)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
    }
}

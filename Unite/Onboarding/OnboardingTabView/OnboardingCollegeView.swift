//
//  OnboardingCollegeView.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/19/23.
//

import SwiftUI

struct OnboardingCollegeView: View {
    
    @State private var getStartedButtonTapped = false
    
    var body: some View {
        VStack {
            NavigationLink(destination: LoginView(), isActive: $getStartedButtonTapped) {
                EmptyView()
            }

            Spacer().frame(height: 40)
            
            Text("For Cal State East Bay community")
                .font(.custom("Poppins-Bold", size: 17))
            
            Spacer().frame(height: 16)
            
            Text("Connect with CSUEB students and alumni and grow your network.")
                .foregroundColor(AppColors.blueTextColor)
                .padding(.leading, 40)
                .padding(.trailing, 40)
                .font(.custom("Poppins-Regular", size: 13))
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 24)
            
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
                getStartedButtonTapped.toggle()
            }
        }
        .padding()
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.secondaryBackground)
    }
}

struct OnboardingCollegeView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCollegeView()
    }
}

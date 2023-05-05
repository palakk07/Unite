//
//  SplashScreen.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/19/23.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var navigateToProfile = false
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: OnboardingView(), isActive: $navigateToProfile) {
                    EmptyView()
                }
                
                Image("splash_bg")
                
                VStack {
                    Spacer()
                    Image("main_logo")
                    Text("Connect and Grow")
                        .foregroundColor(AppColors.redColor)
                        .font(.custom("Poppins-Medium", size: 16))
                    
                    Spacer()
                    Text("For the community of")
                        .foregroundColor(.white)
                        .font(.custom("Poppins-Regular", size: 13))
                    Spacer().frame(height: 8)
                    Image("splash_college")
                    
                    Spacer().frame(height: 64)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(AppColors.blackColor)
        }
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                self.navigateToProfile.toggle()
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

//
//  OnboardingView.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/19/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var showSettings = false
    @State private var settingsDetent = PresentationDetent.medium
    @State private var activeTab = 0
    private var imgNames = ["onboarding1", "onboarding2", "onboarding3"]
    
    var body: some View {
        ZStack {
            Image(imgNames[activeTab])
            
            VStack {
                Spacer()
                
                VStack {
                    OnboardingTabView(activeTab: $activeTab)
                }
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .background(AppColors.secondaryBackground)
                .cornerRadius(30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea(edges: .bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AppColors.blackColor)
        
        .navigationBarBackButtonHidden(true)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

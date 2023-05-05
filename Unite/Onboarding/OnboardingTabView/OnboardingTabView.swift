//
//  OnboardingTabView.swift
//  Unite
//
//  Created by Pranav Bhandari on 4/19/23.
//

import SwiftUI

struct OnboardingTabView: View {

    @Binding var activeTab: Int

    var body: some View {
        VStack {
            TabView(selection: $activeTab) {
                OnboardingCollegeView()
                    .tag(0)
                OnboardingInterestView()
                    .tag(1)
                OnboardingFeedView()
                    .tag(2)
            }
            .ignoresSafeArea()
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
        }
    }
}

struct OnboardingTabView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingTabView(activeTab: .constant(0))
    }
}

//
//  HomeView.swift
//  Restart
//
//  Created by realxnesia on 12/04/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Home View")
                .font(.largeTitle)
            Button {
                isOnboardingActive = true
            } label: {
                Text("Go To Onboarding")
            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

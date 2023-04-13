//
//  OnboardingView.swift
//  Restart
//
//  Created by realxnesia on 12/04/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnBoardingViewActive: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button(action: {
                isOnBoardingViewActive = false // change value
            }) {
                Text("Start")
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

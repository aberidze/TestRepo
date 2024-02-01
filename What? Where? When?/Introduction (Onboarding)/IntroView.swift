//
//  IntroView.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 01.02.24.
//

import SwiftUI

struct IntroView: View {
    
    // MARK: - Properties
    @AppStorage("onboarding_viewed") var onboardingViewed: Bool = false
    
    
    // MARK: - body
    var body: some View {
        ZStack {
            Color(uiColor: .backgroundGray)
                .ignoresSafeArea()
            
            if onboardingViewed {
                LoginView()
            } else {
                OnboardingScreenView()
            }
        }
    }
}


// MARK: - Preview
struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

//
//  OnboardingView.swift
//  Restart
//
//  Created by Kosei Ban on 2022-09-05.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("Onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        
        VStack(spacing: 20){
            
            Text("Onboarding")
                .font(.largeTitle)
            
            Button {
                isOnboardingViewActive = false
            } label: {
                Text("Start")
            }

        }//: VStack
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

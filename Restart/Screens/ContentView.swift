//
//  ContentView.swift
//  Restart
//
//  Created by Kosei Ban on 2022-09-04.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("Onboarding") var isOnboardingViewActi: Bool = true
    
    
    var body: some View {
        ZStack {
            if isOnboardingViewActi {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

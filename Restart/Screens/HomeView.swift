//
//  HomeView.swift
//  Restart
//
//  Created by Kosei Ban on 2022-09-05.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("Onboarding") var isOnboardingViewActive: Bool = false
    
    var body: some View {
        VStack(spacing: 20){
            //MARK: header
            Spacer()
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
            }
            //MARK: center
            Text("The time that leads to mastary is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
        
            //MARK: footer
            Spacer()
                Button {
                    isOnboardingViewActive = true
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                }//: Button
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            }//: footer
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}

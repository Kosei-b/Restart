//
//  HomeView.swift
//  Restart
//
//  Created by Kosei Ban on 2022-09-05.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("Onboarding") var isOnboardingViewActive: Bool = false
    
    @State private var isAnimating: Bool = false
    
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
                    .offset(y: isAnimating ? 30 : -30)
                    .animation(
                        .easeInOut(duration: 4.5)
                        .repeatForever()
                        ,value: isAnimating
                    )
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
                    playSound(sound: "success", type: "m4a")
                    withAnimation(Animation.easeOut(duration: 0.5)){
                        isOnboardingViewActive = true
                    }
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
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.portrait)
    }
}

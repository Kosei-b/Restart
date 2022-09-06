//
//  OnboardingView.swift
//  Restart
//
//  Created by Kosei Ban on 2022-09-05.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("Onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    
    let hapticFeedback = UINotificationFeedbackGenerator()

    var body: some View {
        
        ZStack {
            Color("Blue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20){
                
                //MARK: header
                Spacer()
                VStack(spacing: 0) {
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle)
                    
                    Text("""
                         It's not how much we give but
                         how much love we put into giving.
                         """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }//: header
                .opacity(isAnimating ?  1 : 0)
                .offset(y: isAnimating ? 0: -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                
                //MARK: center
                ZStack{
                    
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        withAnimation(.linear(duration: 0.25)){
                                            indicatorOpacity = 0
                                            textTitle = "Give."
                                        }
                                    }
                                })//: changed
                                .onEnded({ _ in
                                    imageOffset = .zero
                                    withAnimation(.linear(duration: 0.25)){
                                        indicatorOpacity = 1
                                        textTitle = "Share."
                                    }
                                })
                        )//: Gesture
                }//: center
                .overlay(
                Image(systemName: "arrow.left.and.right.circle")
                    .font(.system(size: 44,weight: .ultraLight))
                    .offset(y: 15)
                    .opacity(isAnimating ? 1 : 0 )
                    .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                    .opacity(indicatorOpacity)
                    .foregroundColor(.white),alignment: .bottom
                )
                
                //MARK: footer
                ZStack{
                    // 1 Bacground
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2 Call-To-Action(STATIC)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    // 3 CAPUSULE (DYNAMIC WIDTH)
                    
                    HStack{
                        Capsule()
                            .fill(Color("Red"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    
                    // 4 CIRCLE (DRAGGABLE)
                    
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("Red"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                            
                        }//: ZStack
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80
                                    {
                                        buttonOffset = gesture.translation.width
                                    }
                                }//: Changed
                                .onEnded{ _ in
                                    withAnimation(Animation.easeOut(duration: 0.5)){
                                        if buttonOffset > buttonWidth / 2  + 20 {
                                            hapticFeedback.notificationOccurred(.success)
                                            playSound(sound: "chimeup", type: "mp3")
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        } else {
                                            hapticFeedback.notificationOccurred(.warning)
                                            buttonOffset = 0
                                        }
                                    }
                                    
                                }//: Ended
                        )//: Gesture
                        Spacer()
                    }//: HStack
                } //: footer
                .frame(width:buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ?  1 : 0)
                .offset(y: isAnimating ? 0: 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            }//: VStack
        } //: ZStack
        .onAppear(perform: {
            isAnimating = true
        })
        .preferredColorScheme(.dark)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

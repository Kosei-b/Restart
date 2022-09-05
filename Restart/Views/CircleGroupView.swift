//
//  CircleGroupView.swift
//  Restart
//
//  Created by Kosei Ban on 2022-09-05.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    var body: some View {
        ZStack{
            Circle()
                  .stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 40)
                  .frame(width: 260, height: 260, alignment: .center)
              Circle()
                    .stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 80)
                    .frame(width: 260, height: 260, alignment: .center)
        }//: ZStack
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("Blue")
                .ignoresSafeArea(.all,edges: .all)
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}

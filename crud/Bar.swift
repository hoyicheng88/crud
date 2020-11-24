//
//  Bar.swift
//  crud
//
//  Created by User22 on 2020/11/24.
//

import SwiftUI


struct Bar: View {
    @State private var width: CGFloat = 0
    var Width:Double
    var body: some View {
        ZStack(alignment:.bottom){
            Capsule()
                .frame(width: 30, height: 350)
                .foregroundColor(.gray)
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            VStack(spacing:3){
                Text("\(Int(self.width))")
                Capsule()
                    .foregroundColor(.orange)
                    .frame(width: 30, height: width*20)
                    .animation(.linear(duration: 1))
                    .onAppear{
                        self.width = CGFloat(self.Width)
                    }
            }
        }
    }
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        Bar(Width: 3)
    }
}

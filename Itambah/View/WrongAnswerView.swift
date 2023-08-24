//
//  WrongAnswerView.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 21/08/23.
//

import SwiftUI

struct WrongAnswerView: View {
    @Binding var showWrongView: Bool
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .ignoresSafeArea()
                .foregroundColor(Color("PrimaryColor"))
                .opacity(0.8)
                .blur(radius: 10)
            Circle()
                .frame(width: 201, height: 201)
                .foregroundColor(Color("SecondColor"))
                .shadow(radius: 4, x: 2, y: 2)
            Image(systemName: "xmark")
                .font(.system(size: 100, weight: .bold, design: .rounded))
                .foregroundColor(Color("ThirdColor"))
                .shadow(radius: 2, x: 2, y: 2)
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    showWrongView = false
                }
            }
        }
    }
}

struct WrongAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        WrongAnswerView(showWrongView: .constant(true))
            .previewInterfaceOrientation(.landscapeRight)
    }
}

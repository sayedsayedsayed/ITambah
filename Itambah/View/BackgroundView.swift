//
//  BackgroundView.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 20/08/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
            .foregroundColor(Color("PrimaryColor"))
            Image("Star 1")
                .offset(y:205)
            Image("Star 2")
                .offset(x:300, y: -70)
            Image("Star 3")
                .offset(x: -400, y: 75)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

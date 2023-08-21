//
//  StyleManager.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 20/08/23.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 314, height: 48)
            .background(
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 150, height: 40)
                        .foregroundColor(Color("ThirdColor"))
                        .shadow(radius: 4, x: 2, y: 2)
                }
            )
      .cornerRadius(40.0)
      .foregroundColor(Color("SecondColor"))
      .font(.headline)
      .fontWeight(.bold)
      .fontDesign(.rounded)
  }
}

//
//  ParentView.swift
//  Itambah
//
//  Created by Vicky Irwanto on 15/04/23.
//

import SwiftUI

struct InstructionView: View {
    
    @EnvironmentObject var router: Router
    var body: some View {
        ZStack{
            BackgroundView()
           
            VStack() {
                Text("Instruksi Orang Tua")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                    
                    List(instructions, id: \.self){ data in
                        Text(data)
                            .listRowBackground(Color.clear)
                            .font(.headline)
                            .fontWeight(.light)
                            .fontDesign(.rounded)
                    }
                    .padding()
                    .listStyle(.plain)
                }
                
                Button {
                    router.path.append(Destination.mainView)
                    
                } label: {
                    Text("Mulai Permainan")
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.top, 5)
                
            }
            .frame(width: 700)
            .padding(.top, 20)
            .padding(.bottom, 1)
        }
        
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

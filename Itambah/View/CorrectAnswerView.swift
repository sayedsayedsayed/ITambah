//
//  CorrectAnswerView.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 21/08/23.
//

import SwiftUI

struct CorrectAnswerView: View {
    @ObservedObject var viewModel: BoardViewModel
    
    var body: some View {
        VStack(spacing: 0.0){
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
                Image(systemName: "checkmark")
                    .font(.system(size: 100, weight: .bold, design: .rounded))
                    .foregroundColor(Color("ThirdColor"))
                    .shadow(radius: 2, x: 2, y: 2)
                
            }
            
            if viewModel.board.finalCount {
                
                Button(action: {
//                    self.backHome.toggle()
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 90, height: 40)
                            .foregroundColor(Color("SecondColor"))
                            .shadow(radius: 4, x: 2, y: 2)
                        Text("Selesai")
                    }
                })
//                .sheet(isPresented: $backHome){
//                    HomeView()
//                        .transition(.move(edge: .leading))
//                }
            }
        }
        
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    if !viewModel.board.finalCount{
                        viewModel.board.showCorrectView = false
                    }
                    
                }
            }
        }
    }
}

struct CorrectAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        CorrectAnswerView(viewModel: BoardViewModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}

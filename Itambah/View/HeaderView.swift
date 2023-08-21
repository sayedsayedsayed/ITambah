//
//  HeaderView.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 21/08/23.
//

import SwiftUI

struct HeaderView: View {
    @ObservedObject var viewModel: BoardViewModel
    
    var body: some View {
        HStack{
            Spacer()
            Spacer()
            Spacer()
            
            HintView(viewModel: viewModel)
            
            Spacer()
            
            Image("Hint-1")
                .onTapGesture {
                    viewModel.board.btnHintClicked = true
                }
            Image((viewModel.board.soundBtn) ? "Sound Off-1" : "Sound On-1")
                .onTapGesture {
                    viewModel.board.soundBtn.toggle()
                    
                    if viewModel.board.soundBtn{
                        SoundManager.instance.PlaySound()
                    }else{
                        SoundManager.instance.StopSound()
                    }
                }
            
            Button(action: {
//                self.backHome.toggle()
            }, label: {
                Image("Home-1")
            })
//            .sheet(isPresented: $backHome){
//                HomeView()
//                    .transition(.move(edge: .leading))
//            }
        }
        .padding(.bottom, 15.0)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(viewModel: BoardViewModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}

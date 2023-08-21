//
//  HintView.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 21/08/23.
//

import SwiftUI

struct HintView: View {
    @ObservedObject var viewModel: BoardViewModel
    
    var body: some View {
        if viewModel.board.btnHintClicked {
            Text(hintMessages[viewModel.board.currentStage])
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .frame(width: 400, height: 40)
                .lineLimit(2)
                .minimumScaleFactor(0.7)
                .background(Color("SecondColor"))
                .cornerRadius(8)
                .offset(y: 10)
                .onAppear {
                    if viewModel.board.currentStage == 0 || viewModel.board.currentStage == 2{
                        viewModel.board.isDiceGlow = true
                    }
                    else if viewModel.board.currentStage == 1 || viewModel.board.currentStage == 3{
                        viewModel.board.isDotsGlow = true
                    }
                    else if viewModel.board.currentStage == 4{
                        viewModel.board.isAnswerGlow = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        viewModel.board.btnHintClicked = false
                        viewModel.board.isDiceGlow = false
                        viewModel.board.isDotsGlow = false
                        viewModel.board.isAnswerGlow = false
                    }
                }
            
        }
    }
}

struct HintView_Previews: PreviewProvider {
    static var previews: some View {
        HintView(viewModel: BoardViewModel())
            .previewInterfaceOrientation(.landscapeRight)
    }
}

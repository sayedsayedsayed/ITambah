//
//  MainView.swift
//  Itambah
//
//  Created by Vicky Irwanto on 03/04/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = BoardViewModel()
    
    var body: some View {
        if viewModel.board.showSplashScreen {
            SplashDiceView(viewModel: viewModel)
            
        } else {
            ZStack {
                
                BackgroundView()
                
                VStack(spacing: 0.0){
                    HeaderView(viewModel: viewModel)
                    DiceEquationView(viewModel: viewModel)
                    DotsView(viewModel: viewModel)
                }
                
                
                if ((viewModel.board.checkTrue != true || viewModel.board.finalCount != true) && (viewModel.board.checkFalse == true)){
                    WrongAnswerView(viewModel: viewModel)
                }
                
                if ((viewModel.board.checkTrue == true || viewModel.board.finalCount == true) && viewModel.board.checkCorrect == true) {
                    CorrectAnswerView(viewModel: viewModel)
                }
                
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
        
        
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

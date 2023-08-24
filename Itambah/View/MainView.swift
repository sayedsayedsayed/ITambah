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
                
                if viewModel.board.showWrongView {
                    WrongAnswerView(showWrongView: $viewModel.board.showWrongView)
                } else if viewModel.board.showCorrectView {
                    CorrectAnswerView(viewModel: viewModel)
                }
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

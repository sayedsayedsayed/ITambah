//
//  SplashDiceView.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 21/08/23.
//

import SwiftUI

struct SplashDiceView: View {
    @ObservedObject var viewModel: BoardViewModel

    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    var body: some View{
        ZStack{
            BackgroundView()
            Image("Big Dice \(viewModel.board.diceValue)")
        }
        .onReceive(timer){ _ in
            DispatchQueue.main.async {
                withAnimation {
                    viewModel.board.diceValue = Int.random(in: 1...6)
                }
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    if viewModel.board.firstValue == "?" {
                        viewModel.board.firstValue = String(viewModel.board.diceValue)
                    } else {
                        viewModel.board.secondValue = String(viewModel.board.diceValue)
                    }
                    
//                    //setting the next stage
                    viewModel.board.currentStage += 1
                    viewModel.board.isDiceClickable = false
                    viewModel.board.isDotsClickable = true
                    viewModel.board.isCheckClickable = true
                    viewModel.board.showSplashScreen = false
                }
            }
        }
    }
}

struct SplashDiceView_Previews: PreviewProvider {
    static var previews: some View {
        SplashDiceView(viewModel: BoardViewModel())
            .previewInterfaceOrientation(.landscapeRight)
        
    }
}

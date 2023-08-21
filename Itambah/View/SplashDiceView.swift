//
//  SplashDiceView.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 21/08/23.
//

import SwiftUI

struct SplashDiceView: View {
    @ObservedObject var viewModel: BoardViewModel
    
//    @State var myDice: Int = 1
//    @State var theDice: Int = 1
//    @State var isDiceClickable: Bool = true
//    @State var isDotsClickable: Bool = true
//    @State var isCekClickable: Bool = true
//    @State var isAnswerClickable: Bool = true
//
//    @State var val1: String = ""
//    @State var intVal1: Int = 0
//    @State var val2: String = ""
//    @State var intVal2: Int = 0
//    @State var splash: Bool = true
//    @State var check1: Bool = true
//
//    @State var currentStage: Int = 0

    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    var body: some View{
        ZStack{
            BackgroundView()
//            Image("Big Dice \(myDice)")
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
                    
                    if viewModel.board.firstValue == "?"{
//                        self.val1 = "\(myDice)"
//                        self.intVal1 = myDice
//                        theDice = myDice
                        viewModel.board.firstValue = String(viewModel.board.diceValue)
                    }
                    else{
//                        self.val2 = "\(myDice)"
//                        self.intVal2 = myDice
//                        theDice = myDice
                        viewModel.board.secondValue = String(viewModel.board.diceValue)
                    }
                    
                    
//                    currentStage += 1
//                    //setting the next stage
//                    isDiceClickable = false
//                    isDotsClickable = true
//                    isCekClickable = true
//                    isAnswerClickable = false
                    
//                    self.splash = false
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

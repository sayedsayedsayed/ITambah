//
//  DiceEquationView.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 21/08/23.
//

import SwiftUI

struct DiceEquationView: View {
    @ObservedObject var viewModel: BoardViewModel
    
    var body: some View {
        HStack(spacing: 20){
            Image("Dice \(viewModel.board.diceValue)")
                .scaledToFill()
                .onTapGesture {
                    if viewModel.board.isDiceClickable {
                        viewModel.board.btnHintClicked = false
                        viewModel.board.showSplashScreen = true
                    } else {
                        viewModel.board.btnHintClicked = true
                    }
                }
                .border(viewModel.board.isDiceGlow ? Color.green : Color.clear, width: viewModel.board.isDiceGlow ? 5 : 0)
                .cornerRadius(10)
                .animation(.easeInOut(duration: 3), value: viewModel.board.isDiceGlow)
            
            Text(viewModel.board.firstValue)
                .font(.system(size: 140, weight: .semibold, design: .rounded))
                .foregroundColor(Color(viewModel.board.firstValue == "?" ? "SecondColor": "Purple"))
                .shadow(radius: 2, x: 2, y: 2)
                .scaledToFill()
            Image("Tambah")
            Text(viewModel.board.secondValue)
                .font(.system(size: 140, weight: .semibold, design: .rounded))
                .foregroundColor(Color(viewModel.board.secondValue == "?" ? "SecondColor": "Green"))
                .shadow(radius: 2, x: 2, y: 2)
                .scaledToFill()
            Image("Sama Dengan")
            
            TextField("?", value: $viewModel.board.answerValue, format: .number)
                .frame(width: 151, height: 151)
                .multilineTextAlignment(TextAlignment.center)
                .font(.system(size: 120, weight: .semibold, design: .rounded))
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("SecondColor"), lineWidth: 6)
                }
                .foregroundColor(Color("SecondColor"))
                .scaledToFill()
                .shadow(radius: 4, x: 2, y: 2)
                .keyboardType(.numberPad)
            
                .onTapGesture {
                    if !viewModel.board.isAnswerClickable{
                        viewModel.board.btnHintClicked = true
                    }
                }
                .padding(5)
                .border(viewModel.board.isAnswerGlow ? Color.green : Color.clear, width: viewModel.board.isAnswerGlow ? 5 : 0)
                .cornerRadius(10)
                .animation(.easeInOut(duration: 3), value: viewModel.board.isAnswerGlow)
            
        }
    }
}

struct DiceEquationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            DiceEquationView(viewModel: BoardViewModel())
        }
        .previewInterfaceOrientation(.landscapeRight)
    }
}

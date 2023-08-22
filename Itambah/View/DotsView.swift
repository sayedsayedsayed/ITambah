//
//  DotsView.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 21/08/23.
//

import SwiftUI

struct DotsView: View {
    @ObservedObject var viewModel: BoardViewModel
    
    var body: some View {
        
        HStack {
            
            VStack(spacing: 0.0) {
                //this whole VStack is the stacked dots view
                ForEach(viewModel.board.dots.indices, id: \.self) {
                    rowIndex in
                    HStack{
                        ForEach(viewModel.board.dots[rowIndex].indices, id: \.self){
                            columnIndex in
                            Image("Circle 1")
                                .onTapGesture {
                                    if viewModel.board.isDotsClickable {
                                        withAnimation {
                                            viewModel.dotsTapGesture(rowIndex: rowIndex, columnIndex: columnIndex)
                                        }
                                    }
                                    else{
                                        viewModel.board.btnHintClicked = true
                                    }
                                }
                        }
                        
                    }
                    
                }
                
            }
            .padding(10)
            .border(viewModel.board.isDotsGlow ? Color.green : Color.clear, width: viewModel.board.isDotsGlow ? 5 : 0)
            .cornerRadius(10)
            .animation(.easeInOut(duration: 3), value: viewModel.board.isDotsGlow)
            .padding(.leading, 12)
            
            Spacer()
            
            VStack{
                ZStack{
                    //this whole ZStack is the dots bar view
                    RoundedRectangle(cornerRadius: 17)
                        .frame(width: 570, height: 50)
                        .foregroundColor(Color("SecondColor"))
                        .shadow(radius: 4, x: 2, y: 2)
                    HStack{
                        withAnimation{
                            ForEach(viewModel.board.dotsCount.indices, id: \.self){
                                index in
                                Circle()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(index >= Int(viewModel.board.firstValue) ?? 0  && Int(viewModel.board.secondValue) ?? 0 > 0 ? Color("Green") : Color("Purple"))
                                    .shadow(radius: 2, x: 2, y:2)
                                    .padding(.horizontal, 6)
                                    .onTapGesture {
                                        if viewModel.board.isDotsClickable {
                                            withAnimation{
                                                viewModel.board.dots[viewModel.board.dotsCount[index]].append(contentsOf: [viewModel.board.dots.count+1])
                                                viewModel.board.dotsCount.remove(at: index)
                                            }
                                        }
                                        else{
                                            viewModel.board.btnHintClicked = true
                                        }
                                    }
                                
                            }
                        }
                    }
                }
                
                //this is the cek button view
                Button(action: {
                    if viewModel.board.isCheckClickable {
                        viewModel.checkAnswer()
                    }
                    else{
                        viewModel.board.btnHintClicked = true
                    }
                }, label: {
                    Text("Cek")
                        .font(Font.system(size: 30))
                        .bold()
                        .frame(width: 570, height: 45)
                        .background(Color("MainBlue"))
                        .foregroundColor(Color("SecondColor"))
                        .cornerRadius(10)
                })
                .alignmentGuide(.trailing) { d in d[.trailing] }
                .padding(5)
                .border(viewModel.board.isAnswerGlow ? Color.green : Color.clear, width: viewModel.board.isAnswerGlow ? 5 : 0)
                .cornerRadius(10)
                .animation(.easeInOut(duration: 3), value: viewModel.board.isAnswerGlow)
                
                
            }
            .padding(5)
            .border(viewModel.board.isDotsGlow ? Color.green : Color.clear, width: viewModel.board.isDotsGlow ? 5 : 0)
            .cornerRadius(10)
            .animation(.easeInOut(duration: 3), value: viewModel.board.isDotsGlow)
            .padding(.vertical, 5)
        }
    }
}

struct DotsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundView()
            DotsView(viewModel: BoardViewModel())
        }
        .previewInterfaceOrientation(.landscapeRight)
    }
}

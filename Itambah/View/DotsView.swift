//
//  DotsView.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 21/08/23.
//

import SwiftUI

struct DotsView: View {
    @ObservedObject var viewModel: BoardViewModel
//    @Binding var dots: [[Int]]
//    @Binding var val1: String
//    @Binding var val2: String
//    @Binding var checkTrue: Bool
//    @Binding var checkTrue2: Bool
//    @Binding var dotsCount: [Int]
//    @Binding var hintInformation: String
//    @Binding var hintBtn: Bool
//    @Binding var intVal1: Int
//    @Binding var intVal2: Int
//    @Binding var checkFalse: Bool
//    @Binding var finalCount: Bool
//    @Binding var dotsCountLap1 : Int
//    @Binding var result: Int?
//    @Binding var checkCorrect: Bool
//    @Binding var currentStage: Int
//    @Binding var isDiceClickable: Bool
//    @Binding var isDotsClickable: Bool
//    @Binding var isCekClickable: Bool
//    @Binding var isAnswerClickable: Bool
//    
//    @Binding var isDiceGlow: Bool
//    @Binding var isDotsGlow: Bool
//    @Binding var isAnswerGlow: Bool
    
    var body: some View {
        
        HStack{
            
            VStack(spacing: 0.0){
                //this whole VStack is the stacked dots view
                ForEach(viewModel.board.dots.indices, id: \.self){
                    rowIndex in
                    HStack{
                        ForEach(viewModel.board.dots[rowIndex].indices, id: \.self){
                            columnIndex in
                            Image("Circle 1")
                                .onTapGesture {
                                    if viewModel.board.isDotsClickable{
                                        withAnimation{
                                            if((viewModel.board.secondValue != "?") && (viewModel.board.firstValue != "?") && (viewModel.board.checkTrue == true) && (viewModel.board.checkTrue2 == false)){
                                                removeDots(index: (rowIndex, columnIndex))
                                                viewModel.board.dotsCount.append(rowIndex)
                                            }
                                            else if ((viewModel.board.firstValue != "?" && viewModel.board.checkTrue == false) || (viewModel.board.secondValue != "?" && viewModel.board.checkTrue == false)){
                                                removeDots(index: (rowIndex, columnIndex))
                                                viewModel.board.dotsCount.append(rowIndex)
                                            }
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
                    if viewModel.board.isCheckClickable{
                        if viewModel.board.firstValue != "?" {
                            if viewModel.board.checkTrue == true && viewModel.board.checkTrue2 == true{
                                //Answer text field validation
                                viewModel.board.finalCount = checkResult(Int(viewModel.board.result ?? 0), viewModel.board.dotsCount.count )
                                
                                if viewModel.board.finalCount == false {
                                    //wrong answer -> show wrong display
                                    viewModel.board.checkFalse = true
                                }
                                else {
                                    //correct answer -> show correct display, final stage so no increment
                                    viewModel.board.checkCorrect = true
                                }
                            }
                            else{
                                if viewModel.board.checkTrue == false {
                                    //first number validation
                                    viewModel.board.checkTrue = checkDots(Int(viewModel.board.firstValue) ?? 0, viewModel.board.dotsCount.count)
                                    viewModel.board.dotsCountLap1 = viewModel.board.dotsCount.count
                                    if viewModel.board.checkTrue == false{
                                        //wrong answer -> show wrong display
                                        viewModel.board.checkFalse = true
                                    }
                                    else{
                                        //correct answer -> show correct display and move to the next stage
                                        viewModel.board.checkCorrect = true
//                                        currentStage += 1 // should be 2
                                        
                                        viewModel.board.isDiceClickable = true
                                        viewModel.board.isDotsClickable = false
                                        viewModel.board.isCheckClickable = false
                                        viewModel.board.isAnswerClickable = false
                                    }
                                }
                                else{
                                    //second number validation
                                    viewModel.board.checkTrue2 =  checkDots(Int(viewModel.board.secondValue) ?? 0, viewModel.board.dotsCount.count - viewModel.board.dotsCountLap1)
                                    
                                    if viewModel.board.checkTrue2 == false{
                                        //wrong answer -> show wrong display
                                        viewModel.board.checkFalse = true
                                    }
                                    else{
                                        //correct answer -> show correct display and move to the next stage
                                        viewModel.board.checkCorrect = true
                                        
//                                        currentStage += 1 // should be 4
                                        
                                        viewModel.board.isDiceClickable = false
                                        viewModel.board.isDotsClickable = false
                                        viewModel.board.isCheckClickable = true
                                        viewModel.board.isAnswerClickable = true
                                    }
                                }
                                
                                
                            }
                        }
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
    
    func removeDots(index: (row: Int, cols: Int)){
        viewModel.board.dots[index.row].remove(at: index.cols)
    }
    
    func checkDots(_ val1: Int, _ theDots: Int)-> Bool{
        if val1 == theDots{
            return true
        }else{
            return false
        }
    }
    
    func checkResult(_ result: Int, _ resultDots: Int)-> Bool{
        if result == resultDots{
            return true
        }else{
            return false
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

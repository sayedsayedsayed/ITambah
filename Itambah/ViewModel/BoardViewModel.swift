//
//  Boardswift
//  Itambah
//
//  Created by Sayed Zulfikar on 21/08/23.
//

import Foundation

class BoardViewModel: ObservableObject {
    @Published var board: Board = Board()
    
    func isAnswerCorrect(input: Int) -> Bool {
        guard let firstValue = Int(board.firstValue), let secondValue = Int(board.secondValue) else {
            return false
        }
        return input == firstValue + secondValue
    }
    
    func isDotsCorrect(input: Int) -> Bool {
        guard let secondValue = Int(board.secondValue) else {
            guard let firstValue = Int(board.firstValue) else {
                return false
            }
            return input == firstValue
        }
        return input == secondValue
    }
    
    func removeDots(index: (row: Int, cols: Int)){
        board.dots[index.row].remove(at: index.cols)
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
    
    func checkAnswer() {
        if board.firstValue != "?" {
            if board.checkTrue == true && board.checkTrue2 == true{
                //Answer text field validation
                board.finalCount = checkResult(Int(board.result ?? 0), board.dotsCount.count )
                
                if board.finalCount == false {
                    //wrong answer -> show wrong display
                    board.checkFalse = true
                }
                else {
                    //correct answer -> show correct display, final stage so no increment
                    board.checkCorrect = true
                }
            }
            else{
                if board.checkTrue == false {
                    //first number validation
                    board.checkTrue = checkDots(Int(board.firstValue) ?? 0, board.dotsCount.count)
                    board.dotsCountLap1 = board.dotsCount.count
                    if board.checkTrue == false{
                        //wrong answer -> show wrong display
                        board.checkFalse = true
                    }
                    else{
                        //correct answer -> show correct display and move to the next stage
                        board.checkCorrect = true
                        board.currentStage += 1 // should be 2
                        
                        board.isDiceClickable = true
                        board.isDotsClickable = false
                        board.isCheckClickable = false
                        board.isAnswerClickable = false
                    }
                }
                else{
                    //second number validation
                    board.checkTrue2 =  checkDots(Int(board.secondValue) ?? 0, board.dotsCount.count - board.dotsCountLap1)
                    
                    if board.checkTrue2 == false{
                        //wrong answer -> show wrong display
                        board.checkFalse = true
                    }
                    else{
                        //correct answer -> show correct display and move to the next stage
                        board.checkCorrect = true
                        
                        board.currentStage += 1 // should be 4
                        
                        board.isDiceClickable = false
                        board.isDotsClickable = false
                        board.isCheckClickable = true
                        board.isAnswerClickable = true
                    }
                }
                
                
            }
        }
    }
    
    func dotsTapGesture(rowIndex: Int, columnIndex: Int) {
        if ((board.secondValue != "?") && (board.firstValue != "?") && (board.checkTrue == true) && (board.checkTrue2 == false)) {
            removeDots(index: (rowIndex, columnIndex))
            board.dotsCount.append(rowIndex)
        }
        else if ((board.firstValue != "?" && board.checkTrue == false) || (board.secondValue != "?" && board.checkTrue == false)){
            removeDots(index: (rowIndex, columnIndex))
            board.dotsCount.append(rowIndex)
        }
    }
}

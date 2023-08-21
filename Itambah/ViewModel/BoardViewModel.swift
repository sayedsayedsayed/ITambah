//
//  BoardViewModel.swift
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
}

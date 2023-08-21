//
//  BoardModel.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 21/08/23.
//

import Foundation

struct Board {
    var diceValue: Int = 1
    var isDiceClickable: Bool = true
    var firstValue: String = "?"
    var secondValue: String = "?"
    var answerValue: Int?
    var isAnswerClickable: Bool = true
//    var dotsCounter: Int = 0 //???
    var showSplashScreen: Bool = false
    
    var btnHintClicked: Bool = true
    var isDiceGlow: Bool = false
    var isAnswerGlow: Bool = false
    
    var isDotsClickable: Bool = false
    var isCheckClickable: Bool = false
    
    var checkTrue: Bool = false
    var checkTrue2: Bool = false
    
    var dots : [[Int]] = [[1,2,3], [4,5,6], [7,8,9], [10,11,12]]
    var dotsCount: [Int] = []
    var finalCount = false
    var result: Int?
    var checkFalse = false
    var dotsCountLap1 : Int = 0
    var isDotsGlow: Bool = false
    var checkCorrect = false
    
    var currentStage: Int = 0
    var soundBtn: Bool = true
}
 

//
//  TicTacToeModel.swift
//  TicTacToe
//
//  Created by Amini on 07/12/22.
//

import SwiftUI

class TicTacToeModel : ObservableObject{
    @Published var squares = [Square]()
    
    init() {
        for _ in 0...8 {
            squares.append(Square(squareState: .empty))
        }
    }
    
    func resetGame() {
        squares.removeAll()
        for _ in 0...8 {
            squares.append(Square(squareState: .empty))
        }
    }
    
    var gameOver: (SquareState, Bool) {
        get {
            if thereIsAWinner != .empty {
                return (thereIsAWinner, true)
            } else {
                for i in 0...8 {
                    if squares[i].squareState == .empty {
                        return (.empty, false)
                    }
                }
                return (.empty, true)
            }
        }
    }
    
    private var thereIsAWinner: SquareState {
        get {
            if let check = self.checkIndexes([0, 1, 2]) {
                return check
            } else if let check = self.checkIndexes([3, 4, 5]) {
                return check
            } else if let check = self.checkIndexes([6, 7, 8]) {
                return check
            }else if let check = self.checkIndexes([0, 3, 6]) {
                return check
            }else if let check = self.checkIndexes([1, 4, 7]) {
                return check
            }else if let check = self.checkIndexes([2, 5, 8]) {
                return check
            }else if let check = self.checkIndexes([0, 4, 8]) {
                return check
            }else if let check = self.checkIndexes([2, 4, 6]) {
                return check
            }
            return .empty
        }
    }
    
    private func checkIndexes(_ indexes: [Int]) -> SquareState? {
        var homeCounter: Int = 0
        var visitorCounter: Int = 0
        for index in indexes {
            let square = squares[index]
            if square.squareState == .home {
                homeCounter += 1
            } else if square.squareState == .visitor {
                visitorCounter += 1
            }
        }
        
        if homeCounter == 3 {
            return .home
        } else if visitorCounter == 3 {
            return .visitor
        }
        
        return nil
    }
    
    private func moveAI() {
        var index = Int.random(in: 0...8)
        while makeMove(index: index, player: .visitor) == false && gameOver.1 == false {
            index = Int.random(in: 0...8)
        }
    }
    
    func makeMove(index: Int, player: SquareState) -> Bool {
        if squares[index].squareState == .empty {
            squares[index].squareState = player
            if player == .home {
                // Move AI
                moveAI()
            }
            return true
        }
        return false
    }
    
}

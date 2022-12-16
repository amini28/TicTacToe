//
//  SquareState.swift
//  TicTacToe
//
//  Created by Amini on 07/12/22.
//

import SwiftUI

enum SquareState {
    case empty
    case home
    case visitor
}

class Square : ObservableObject {
    @Published var squareState: SquareState
    init(squareState: SquareState) {
        self.squareState = squareState
    }
}

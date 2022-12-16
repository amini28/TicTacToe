//
//  ContentView.swift
//  TicTacToe
//
//  Created by Amini on 23/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var tictactoeModel = TicTacToeModel()
    @State var gameOver: Bool = false
    
    func buttonAction(_ index: Int) {
        _ = self.tictactoeModel.makeMove(index: index, player: .home)
        self.gameOver = self.tictactoeModel.gameOver.1
    }
    
    var body: some View {
        VStack {
            Text("Tick Tac Toe")
                .bold()
                .foregroundColor(.black.opacity(0.7))
                .padding(.bottom)
                .font(.title2)
            
            ForEach(0 ..< tictactoeModel.squares.count / 3, id: \.self) { row in
                HStack {
                    ForEach(0..<3) { column in
                        let index = row * 3 + column
                        SquareView(dataSource: tictactoeModel.squares[index],
                                   action: { self.buttonAction(index) })
                    }
                }
            }
        }
        .alert(isPresented: self.$gameOver) {
            Alert(title: Text("Game Over"),
                  message: Text(self.tictactoeModel.gameOver.0 != .empty ? self.tictactoeModel.gameOver.0 == .home ? "YOU WIN" : "AI WINS" : "NOBODY WINS"),
                  dismissButton: Alert.Button.destructive(Text("Ok"),
                                                          action: { self.tictactoeModel.resetGame() })
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  SquareView.swift
//  TicTacToe
//
//  Created by Amini on 07/12/22.
//

import SwiftUI

struct SquareView: View {
    @ObservedObject var dataSource: Square
    var action: () -> Void
    var size: CGFloat = (UIScreen.main.bounds.width/3) - 30
    
    var body: some View {
        Button {
            self.action()
        } label: {
            Text(self.dataSource.squareState == .home ? "x" : self.dataSource.squareState == .visitor ? "0" : " ")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.black)
                .padding(4)
        }
        .frame(width: size, height: size)
        .background(Color.gray.opacity(0.3).cornerRadius(10))

    }
}

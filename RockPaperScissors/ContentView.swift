//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Yosef Ben Zaken on 24/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldWin: Bool = Bool.random()
    @State private var score: Int = 0
    @State private var turn: Int = 0
    @State private var appMove: Int = Int.random(in: 0...2)
    @State private var showingGameOver: Bool = false
    let moves = ["✊", "✋", "✌️"]
    var body: some View {
        VStack {
            Text("Your Score: \(score)")
                .font(.title)
            Spacer()
            Text("I choose").font(.title)
            Text(moves[appMove]).font(.system(size: 150))
            Text("and you need to \(shouldWin ? "win" : "lose")").font(.title)
            Spacer()
            HStack {
                ForEach(moves, id: \.self) { move in
                    Button {
                        moveSelect(move)
                    } label: {
                        Text(move).font(.system(size: 100))
                    }
                    
                }
            }
            Spacer()
            Spacer()
        }
        .alert("Game Over", isPresented: $showingGameOver) {
            Button("Reset Game", action: reset)
        }
    }
    func reset() {
        appMove = Int.random(in: 0...2)
        shouldWin = Bool.random()
        turn = 0
        score = 0
    }
    func moveSelect(_ emoji: String) {
        if shouldWin {
            let winningMoves = ["✋", "✌️", "✊"]
            score += winningMoves[appMove] == emoji ? 1 : -1
        } else {
            let losingMoves = ["✌️","✊","✋"]
            score += losingMoves[appMove] == emoji ? 1 : -1
        }
        turn += 1
        appMove = Int.random(in: 0...2)
        shouldWin.toggle()
        if turn >= 10 {
            showingGameOver = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

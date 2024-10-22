//
//  GameResult.swift
//  MovieQuiz
//
//  Created by user on 18.10.2024.
//

import UIKit

struct GameResult: Codable {
    let correct: Int
    let total: Int
    let date: Date
    
    func isBetterThan(_ another: GameResult) -> Bool {
            correct > another.correct
        }
}

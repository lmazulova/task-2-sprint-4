//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by user on 18.10.2024.
//

import UIKit

final class StatisticService: StatisticServiceProtocol {
    // MARK: - Private Properties
    private let storage: UserDefaults = .standard
    private enum Keys: String {
        case correct
        case bestGame
        case gamesCount
    }
    
    // MARK: - Computed Properties
    var gamesCount: Int {
        get {
            storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: "\(Keys.bestGame.rawValue)_correct")
            let total = storage.integer(forKey: "\(Keys.bestGame.rawValue)_total")
            let date = storage.object(forKey: "\(Keys.bestGame.rawValue)_date") as? Date ?? Date()
            return GameResult(correct: correct, total: total, date: date)
        }
        set {
            storage.set(newValue.correct, forKey: "\(Keys.bestGame.rawValue)_correct")
            storage.set(newValue.total, forKey: "\(Keys.bestGame.rawValue)_total")
            storage.set(newValue.date, forKey: "\(Keys.bestGame.rawValue)_date")
        }
    }
    private var correctAnswers: Int {
        get {
            storage.integer(forKey: "correctAnswers")
        }
        set {
            storage.set(newValue, forKey: "correctAnswers")
        }
    }
    
    var totalAccuracy: Double {
        return gamesCount > 0 ? Double(correctAnswers)/Double(gamesCount)*10 : 0
    }
    
    // MARK: - Public Methods
    func store(correct count: Int, total amount: Int) {
        gamesCount += 1
        correctAnswers += count
        let currentGame = GameResult(correct: count, total: amount, date: Date())
        if currentGame.isBetterThan(bestGame) {
            bestGame = currentGame
        }
    }
}

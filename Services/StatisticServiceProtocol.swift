//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by user on 18.10.2024.
//

import UIKit

protocol StatisticServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var totalAccuracy: Double { get }
    func store(correct count: Int, total amount: Int)
}

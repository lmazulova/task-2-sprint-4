//
//  QuestionFactoryDelegat.swift
//  MovieQuiz
//
//  Created by user on 08.10.2024.
//

import Foundation
protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}

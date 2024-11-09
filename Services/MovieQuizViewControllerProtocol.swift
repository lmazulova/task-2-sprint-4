//
//  MovieQuizViewControllerProtocol.swift
//  MovieQuiz
//
//  Created by user on 09.11.2024.
//

import UIKit

protocol MovieQuizViewControllerProtocol: UIViewController {
    
    func show(quiz step: QuizStepViewModel)
    
    func highlightImageBorder(isCorrect: Bool)
    func changeStateButton(isEnabled: Bool)
    func showQuizResults(alertModel: AlertModel)
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func showNetworkError(message: String)
}

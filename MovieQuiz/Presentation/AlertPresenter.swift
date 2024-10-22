//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by user on 17.10.2024.
//

import UIKit

final class AlertPresenter {
    var alert: AlertModel?
    let viewController: MovieQuizViewController?
    
    func showResults(quiz result: AlertModel){
        let alert = UIAlertController(title: result.title, message: result.message, preferredStyle: .alert)
        let action = UIAlertAction(title: result.buttonText, style: .default) {_ in result.completion()}
        alert.addAction(action)
        if let viewController = viewController {
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    init(alert: AlertModel? = nil, viewController: MovieQuizViewController?) {
        self.alert = alert
        self.viewController = viewController
    }
}

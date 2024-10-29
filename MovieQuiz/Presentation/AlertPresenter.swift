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
    
    func showResults(model: AlertModel){
        let alert = UIAlertController(title: model.title, message: model.message, preferredStyle: .alert)
        let action = UIAlertAction(title: model.buttonText, style: .default) {_ in model.completion()}
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

//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by user on 17.10.2024.
//

import UIKit

final class AlertPresenter {
    // MARK: - Public Properties
    var alert: AlertModel?
    let viewController: MovieQuizViewControllerProtocol?
    
    // MARK: - Initializers
    init(alert: AlertModel? = nil, viewController: MovieQuizViewControllerProtocol?) {
        self.alert = alert
        self.viewController = viewController
    }
    
    // MARK: - Public Methods
    func showResults(model: AlertModel){
        let alert = UIAlertController(title: model.title, message: model.message, preferredStyle: .alert)
        alert.view.accessibilityIdentifier = "Game results"
        let action = UIAlertAction(title: model.buttonText, style: .default) {_ in model.completion()}
        alert.addAction(action)
        if let viewController = viewController {
            viewController.present(alert, animated: true, completion: nil)
        }
        
    }
}

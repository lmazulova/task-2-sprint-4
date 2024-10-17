//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by user on 17.10.2024.
//

import UIKit
struct AlertModel {
    var title: String
    var message: String
    var buttonText: String
    var completion: () -> Void
}

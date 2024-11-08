//
//  ArrayTests.swift
//  MovieQuizTests
//
//  Created by user on 05.11.2024.
//

import XCTest
@testable import MovieQuiz

final class MovieQuizViewControllerMock: UIViewController, MovieQuizViewControllerProtocol {
    func changeStateButton(isEnabled: Bool) {
        
    }
    
    func showQuizResults(alertModel: MovieQuiz.AlertModel) {
        
    }
    
    func show(quiz step: MovieQuiz.QuizStepViewModel) {
    
    }
    
    func highlightImageBorder(isCorrect: Bool) {
        
    }
    
    func showLoadingIndicator() {
        
    }
    
    func hideLoadingIndicator() {
        
    }
    
    func showNetworkError(message: String) {
        
    }
}

final class MovieQuizPresenterTests: XCTestCase {
    func testPresenterConvertModel() throws {
        let viewControllerMock = MovieQuizViewControllerMock()
        let sut = MovieQuizPresenter(viewController: viewControllerMock)
        
        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question test text", correctAnswer: true)
        let viewModel = sut.convert(model: question)
        
        XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, "Question test text")
        XCTAssertEqual(viewModel.questionNumber, "1/10 ")
    }
}

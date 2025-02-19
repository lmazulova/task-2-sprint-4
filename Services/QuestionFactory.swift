//
//  QuestionFactory.swift
//  MovieQuiz
//
//  Created by user on 07.10.2024.
//

import Foundation

class QuestionFactory: QuestionFactoryProtocol {
    
    // MARK: - Private Properties
    private let moviesLoader: MoviesLoading
    private var movies: [MostPopularMovie] = []
    
    // MARK: - Delegate
    weak var delegate: QuestionFactoryDelegate?
    
    // MARK: - Initializers
    init(moviesLoader: MoviesLoading, delegate: QuestionFactoryDelegate? = nil) {
        self.moviesLoader = moviesLoader
        self.delegate = delegate
    }
    
    // MARK: - Public Methods
    func loadData() {
        moviesLoader.loadMovies { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case .success(let mostPopularMovies):
                    self.movies = mostPopularMovies.items // сохраняем фильм в нашу новую переменную
                    self.delegate?.didLoadDataFromServer() // сообщаем, что данные загрузились
                case .failure(let error):
                    self.delegate?.didFailToLoadData(with: error) // сообщаем об ошибке нашему MovieQuizViewController
                }
            }
        }
    }
    
    func requestNextQuestion() {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            
            let index = (0..<self.movies.count).randomElement() ?? 0
            
            guard let movie = self.movies[safe: index] else { return }
            
            var imageData = Data()
            
            do {
                imageData = try Data(contentsOf: movie.resizedImageURL)
            } catch {
                print("Failed to load image")
            }
            
            let rating = Float(movie.rating) ?? 0
            let variationsQuestion: [Int] = [Int(rating - 1), Int(rating), Int(rating + 1)]
            let questionsRating = variationsQuestion.randomElement()
            let text = "Рейтинг этого фильма больше чем \(questionsRating ?? 6)?"
            let correctAnswer = rating > Float(questionsRating ?? 6)
            let question = QuizQuestion(image: imageData,
                                        text: text,
                                        correctAnswer: correctAnswer)
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.delegate?.didReceiveNextQuestion(question: question)
            }
        }
    }
}

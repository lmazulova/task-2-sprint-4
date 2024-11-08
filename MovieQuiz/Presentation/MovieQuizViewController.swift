import UIKit

final class MovieQuizViewController: UIViewController, MovieQuizViewControllerProtocol {
    // MARK: - IB Outlets
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var textLabel: UILabel!
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var noButton: UIButton!
    @IBOutlet weak private var yesButton: UIButton!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Private Properties
    private var presenter: MovieQuizPresenter!
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MovieQuizPresenter(viewController: self)
        imageView.layer.cornerRadius = 20
    }
    // MARK: - IB Actions
    @IBAction private func noButtonClicked(_ sender: UIButton) {
        presenter.answerGiven(answer: false)
    }
    
    @IBAction private func yesButtonClicked(_ sender: UIButton) {
        presenter.answerGiven(answer: true)
    }
    
    // MARK: - Public Methods
    func show(quiz step: QuizStepViewModel) {
        imageView.layer.borderWidth = 8
        textLabel.text = step.question
        counterLabel.text = step.questionNumber
        imageView.image = step.image
    }
    
    func highlightImageBorder(isCorrect: Bool) {
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 8
        imageView.layer.borderColor = isCorrect ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        imageView.layer.cornerRadius = 20
    }
    
    func showQuizResults(alertModel: AlertModel) {
        let alertShow = AlertPresenter(viewController: self)
        alertShow.showResults(model: alertModel)
    }
    
    func showLoadingIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func changeStateButton(isEnabled: Bool){
        yesButton.isEnabled = isEnabled
        noButton.isEnabled = isEnabled
    }
    
    func hideLoadingIndicator() {
        activityIndicator.isHidden = true
    }
    
    func showNetworkError(message: String) {
        hideLoadingIndicator()
        let alert = AlertModel(title: "Ошибка!",
                               message: message,
                               buttonText: "Попробовать ещё раз",
                               completion: {
            [weak self] in
            guard let self = self else {return}
            self.presenter.restartGame()
            
        })
        let alertShow = AlertPresenter(viewController: self)
        alertShow.showResults(model: alert)
        presenter = MovieQuizPresenter(viewController: self)
    }
    
}

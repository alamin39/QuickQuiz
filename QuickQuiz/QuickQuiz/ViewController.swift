//
//  ViewController.swift
//  QuickQuiz
//
//  Created by Al-Amin on 25/2/21.
//  Copyright © 2021 Al-Amin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!

    var finalScore = 0
    var queNo = 0
    var queList = [Question]()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestionaires()
        startOver()
    }

    @IBAction func selectedAnswerPressed(_ sender: UIButton) {
        if queNo < queList.count {
            let ansVal = queList[queNo].ans ? 1 : 0
            if sender.tag == ansVal {
                ProgressHUD.showSuccess("Correct!")
                finalScore += 1
            }
            else {
                ProgressHUD.showError("Wrong!!")
            }
            queNo += 1
            updateScores()
        }
        askQuestion()
    }

    private func updateQuestionaires() {

        queList.append(Question(text: "Valentine\'s day is banned in Saudi Arabia.", correctAnswer: true))

        queList.append(Question(text: "A slug\'s blood is green.", correctAnswer: true))

        queList.append(Question(text: "Approximately one quarter of human bones are in the feet.", correctAnswer: true))

        queList.append(Question(text: "The total surface area of two human lungs is approximately 70 square metres.", correctAnswer: true))

        queList.append(Question(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", correctAnswer: true))

        queList.append(Question(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", correctAnswer: false))

        queList.append(Question(text: "It is illegal to pee in the Ocean in Portugal.", correctAnswer: true))

        queList.append(Question(text: "You can lead a cow down stairs but not up stairs.", correctAnswer: false))

        queList.append(Question(text: "Google was originally called \"Backrub\".", correctAnswer: true))

        queList.append(Question(text: "Buzz Aldrin\'s mother\'s maiden name was \"Moon\".", correctAnswer: true))

        queList.append(Question(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", correctAnswer: false))

        queList.append(Question(text: "No piece of square dry paper can be folded in half more than 7 times.", correctAnswer: false))

        queList.append(Question(text: "Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.", correctAnswer: true))
    }

    private func askQuestion() {
        if queNo < queList.count {
            questionLabel.text = queList[queNo].questionDetails
        }
        else {
            showAlert()
        }
    }

    private func updateScores() {
        scoreLabel.text = "Score: \(finalScore)"
        progressLabel.text = "\(queNo)/\(queList.count)"
        progressView.progress += (1.0 / Float(queList.count))
    }

    private func showAlert() {
        let alert = UIAlertController(title: "Awesome!", message: "You've finished all the questions. Do you want to start over?", preferredStyle: .alert)

        let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { _ in
            self.startOver()
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
        }
        alert.addAction(restartAction)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }

    private func startOver() {
        finalScore = 0
        queNo = 0
        scoreLabel.text = "Score: \(finalScore)"
        progressLabel.text = "\(queNo)/\(queList.count)"
        progressView.progress = 0.0
        questionLabel.text = queList[queNo].questionDetails
    }

}

//
//  Questions.swift
//  QuickQuiz
//
//  Created by Al-Amin on 25/2/21.
//  Copyright © 2021 Faruk Hossain. All rights reserved.
//

import Foundation

class Question {
    var questionDetails: String
    var ans: Bool

    init(text: String, correctAnswer: Bool) {
        questionDetails = text
        ans = correctAnswer
    }
}

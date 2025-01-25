
import Foundation

struct Question {
    var text: String
    var answers: [String]
    var correctAnswer: String
    
    init(q: String, a: [String],correctAnswer: String) {
        text = q
        answers = a
        self.correctAnswer=correctAnswer
    }
}


import UIKit

class ViewController: UIViewController {
    
    var quizBrain=QuizBrain()
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        QuestionLabel.text=quizBrain.quizes[0].text
        ProgressBar.progress=Float(1)/Float(quizBrain.quizes.count)
        firstButton.setTitle(quizBrain.getAnswer(0), for: .normal)
        secondButton.setTitle(quizBrain.getAnswer(1), for: .normal)
        thirdButton.setTitle(quizBrain.getAnswer(2), for: .normal)
    }
    @IBAction func pressedButton(_ sender: UIButton) {
        let userAnswer=sender.currentTitle!
        let gotItRight=quizBrain.answerCheck(userAnswer)
        if gotItRight{
            sender.backgroundColor=UIColor.green
        }
        else{
            sender.backgroundColor=UIColor.red
        }
        
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @objc func updateUI(){
        QuestionLabel.text=quizBrain.getQuestionText()
        ProgressBar.progress=quizBrain.getProgress()
        ScoreLabel.text="Score : \(quizBrain.score)"
        firstButton.setTitle(quizBrain.getAnswer(0), for: .normal)
        secondButton.setTitle(quizBrain.getAnswer(1), for: .normal)
        thirdButton.setTitle(quizBrain.getAnswer(2), for: .normal)
        /*let seconds = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {*/
        self.firstButton.backgroundColor=UIColor.clear
        self.secondButton.backgroundColor=UIColor.clear
        self.thirdButton.backgroundColor=UIColor.clear

       // }
        
    }
}




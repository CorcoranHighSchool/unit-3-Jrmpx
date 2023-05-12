//
//  QuestionsVC.swift
//  Peronality Quiz
//
//  Created by Heriberto Mojica Santata on 4/25/23.
//

import UIKit

class QuestionsVC: UIViewController {
    //Thisis where all the questions and such resied 
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var singleStackView:UIStackView!
    @IBOutlet weak var  singleButton1: UIButton!
    @IBOutlet weak var  singleButton2: UIButton!
    @IBOutlet weak var  singleButton3: UIButton!
    @IBOutlet weak var  singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var  multipleLabel1: UILabel!
    @IBOutlet weak var  multipleLabel2: UILabel!
    @IBOutlet weak var  multipleLabel3: UILabel!
    @IBOutlet weak var  multipleLabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    var questionIndex = 0
    
    var answersChosen: [Answer] = []
    
    //this the to formatat the type of questions an the avaible anwsers
    var questions: [Question] = [
        Question(text: "Which do you do in free time ?",
                 type: .single,
                 answers: [
                    Answer(text: "write", type: .hand),
                    Answer(text: "bath", type: .spring),
                    Answer(text: "gamble", type: .lucky),
                    Answer(text: "toy", type: .toxic),
                 ]
        ),
        Question(text: "What is your faviote thing in the world ?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Working", type: .hand),
                    Answer(text: "realking", type: .spring),
                    Answer(text: "play yahheze", type: .lucky),
                    Answer(text: "wird", type: .toxic)
                 ]
        ),
        Question(text: "How much do you enjoy life?",
                 type: .Range,
                 answers: [
                    Answer(text: "I dislike it", type: .toxic),
                    Answer(text: "I get a little nervous", type: .lucky),
                    Answer(text: "I bearly motice them", type: .hand),
                    Answer(text: "I love them", type: .spring)
                 ]
        )
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
  
    //updates the UI to display the anwsers
    }
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .Range:
            updateRangedStack(using: currentAnswers)
        }
    }
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    func updateMultipleStack(using answers: [Answer]){
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
        
    }
    func updateRangedStack(using answers: [Answer]){
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5 , animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
        
    }
    // for the one single anwser button question
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswer[0])
        case singleButton2:
            answersChosen.append(currentAnswer[1])
        case singleButton3:
            answersChosen.append(currentAnswer[2])
        case singleButton4:
            answersChosen.append(currentAnswer[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    
    //for the multipl type buttion qustion
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    //for the range quetions
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    
    
    // goes to the next question
    func nextQuestion(){
        questionIndex += 1
        
        if questionIndex < questions.count{
            updateUI()
        }else{
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }

    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsVC? {
        return ResultsVC(coder: coder, responses: answersChosen)
        
    }
}

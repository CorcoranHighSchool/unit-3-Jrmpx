//
//  ResultsVC.swift
//  Peronality Quiz
//  Created by Heriberto Mojica Santata on 4/25/23.
//

import UIKit

class ResultsVC: UIViewController {
    
    // this is for gving the results of the awnsers and such
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
    var responses:[Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResults()
        navigationItem.hidesBackButton = true
    }
    //This does the actually things to find the awnere
    func calculatePersonalityResults() {
        let frequencyOfAnswers = responses.reduce(into: [:]){
            (counts, answer) in
            counts[answer.type, default: 0] += 1
    
        }
        let frequencyOfAnswersSorted = frequencyOfAnswers.sorted(by:
        { (pair1, pair2) in
            return pair1.value > pair2.value
            
        })
        
        let mostCommonAnswer = frequencyOfAnswersSorted.sorted { $0.1 > $1.1}.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        
        
    }
    
}

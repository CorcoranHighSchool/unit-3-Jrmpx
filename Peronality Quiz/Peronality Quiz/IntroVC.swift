//
//  IntroVC .swift
//  Peronality Quiz
//
//  Created by Heriberto Mojica Santata on 4/19/23.
//

import UIKit

class IntroVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startQuizPressed(_ sender: Any) {
        performSegue(withIdentifier: "startQuiz", sender: nil )
    }
    
    @IBAction func unwindToQuizIntroduction(segue:
    UIStoryboardSegue){
        
    }
    
}

 

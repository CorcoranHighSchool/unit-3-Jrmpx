//
//  ViewController.swift
//  Login
//
//  Created by Heriberto Mojica Santata on 3/29/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var ForgotUsername: UIButton!
    
    @IBOutlet weak var ForgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        
        if sender == ForgotUsername {
            segue.destination.navigationItem.title = "Forgot Username"
        }else if sender == ForgotPassword{
            segue.destination.navigationItem.title = " Forgot Password"
        }else{
            segue.destination.navigationItem.title = usernameTextField.text
        }
    }
    
    @IBAction func ForgotUsernameBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: ForgotUsername)
    }
    
    @IBAction func ForgotPasswordBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "forgotUsernameOrPassword", sender: ForgotPassword)
    }
    
    
    
    
}


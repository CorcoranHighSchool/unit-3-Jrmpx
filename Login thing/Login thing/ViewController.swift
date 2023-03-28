//
//  ViewController.swift
//  Login thing
//
//  Created by Heriberto Mojica Santata on 2/27/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var forgotUsernameButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {return}
        if sender == forgotPasswordButton {
            segue.destination.navigationItem.title = "Forgot Password"
        }else if sender == forgotUsernameButton{
            segue.destination.navigationItem.title = "Forgot Username"
        }else{
            segue.destination.navigationItem.title = usernameTextField.text
            }
        }
    

    
    @IBAction func forgotUsername(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUserNameorPassword", sender: forgotUsername)
        
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUserNameorPassword", sender: forgotPassword)
    }
    
    
    
    
}


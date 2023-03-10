//
//  ViewController.swift
//  Traffic light
//
//  Created by Heriberto Mojica Santata on 2/22/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var segueSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func unwindToread(unwindSegue : UIStoryboardSegue){
        
    }
    @IBAction func yellowButtonTaped(_ sender: Any) {
        if segueSwitch.isOn{
            performSegue(withIdentifier: "Yellow", sender: nil)
        }
        
    }
    @IBAction func greenButtonTaped(_ sender: Any) {
        if segueSwitch.isOn{
            performSegue(withIdentifier: "Green", sender: nil)
        }
    }
    
}


//
//  ViewController.swift
//  LifeCycle
//
//  Created by Heriberto Mojica Santata on 3/21/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewController = view Did Load");
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController - view will aperar")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewController-View Did appeprar")
    }

}


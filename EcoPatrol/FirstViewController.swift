//
//  FirstViewController.swift
//  EcoPatrol
//
//  Created by Kellie Sucha on 8/4/21.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var loginMessage: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountMessage: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var stateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func `continue`(_ sender: UIButton) {
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

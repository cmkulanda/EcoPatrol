//
//  FirstViewController.swift
//  EcoPatrol
//
//  Created by Kellie Sucha on 8/4/21.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var loginMessage: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var createAccountMessage: UILabel!
    @IBOutlet weak var state: UILabel!
    var selectedCountry: String?
    var countryList = [" ", "Illinois", " "]
    @IBOutlet weak var stateTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        dismissPickerView()
        
    }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
                return 1
            }
            
            func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
                return countryList.count
            }
            
            func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                return countryList[row]
               
            }
            
            func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                selectedCountry = countryList[row]
                stateTextField.text = selectedCountry
            }
            
            func createPickerView() {
                let pickerView = UIPickerView()
                pickerView.delegate = self
                stateTextField.inputView = pickerView
            }
            
            func dismissPickerView() {
                let toolBar = UIToolbar()
                toolBar.sizeToFit()
                
                let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
                toolBar.setItems([button], animated: true)
                toolBar.isUserInteractionEnabled = true
                stateTextField.inputAccessoryView = toolBar
            }
            
            @objc func action() {
               view.endEditing(true)
            }
         

        
        
        
        
        
        
    
    @IBAction func `continue`(_ sender: UIButton) {
    }
    
    
    
}


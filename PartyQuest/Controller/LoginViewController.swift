//
//  LoginViewController.swift
//  PartyQuest
//
//  Created by Josep Gonzalez Fernandez on 21/2/16.
//  Copyright © 2016 Josep Gonzalez Fernandez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var alertMessageLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case kSegueA1SayHello:
                if let vc = segue.destinationViewController as? HelloViewController {
                    vc.name = nameTextField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                }
            default:
                break
            }
        }
    }
    
    // MARK: Own Methods
    
    private func setupController() {
        nameTextField.layer.cornerRadius = 10
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.borderColor = kColorOrangeLight.CGColor
            
        submitButton.layer.cornerRadius = 10
        submitButton.layer.masksToBounds = true
    }
    
    // MARK: IBAction Methods
    
    @IBAction func submitName(sender: UIButton) {
        guard !nameTextField.text!.isEmpty else {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.alertMessageLabel.alpha = 1
            })
            return
        }
        performSegueWithIdentifier(kSegueA1SayHello, sender: sender)
    }    
    
    @IBAction func nameEditingChanged(sender: UITextField) {
        if !nameTextField.text!.isEmpty && alertMessageLabel.alpha == 1 {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.alertMessageLabel.alpha = 0
            })
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
}
//
//  ViewController.swift
//  MyResume
//
//  Created by Brian Foutty on 5/5/21.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Instance Properties
    
    // #24
    let phoneNumber = "3305555555"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IB Actions
    // #23
    @IBAction func callMe(_ sender: Any) {
            // #25 - all code and comments in this code block
            // this line of code enables a physical device to call our phone number so the person can leave us a voicemail
            if let url = NSURL(string: "tel://\(phoneNumber)") {
                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                // this line of code demonstrates that the call button will work and actually call the number. This is inserted to demo functionality
                // since the Simulator cannot make a phone call. This line will print a string to the console.
                print("The phone is calling my number. Voicemail will be triggered automatically.")
            }
        }
    

}


//
//  ViewController.swift
//  MyResume
//
//  Created by Brian Foutty on 5/5/21.
//

// #26.3
import SafariServices
import UIKit

class ViewController: UIViewController, SFSafariViewControllerDelegate {
    // MARK: - Instance Properties
    
    // #23
    let phoneNumber = "3308470503"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IB Actions
    // #22
    @IBAction func callMe(_ sender: Any) {
            // #24 - all code and comments in this code block
            // this line of code enables a physical device to call our phone number so the person can leave us a voicemail
            if let url = NSURL(string: "tel://\(phoneNumber)") {
                UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                // this line of code demonstrates that the call button will work and actually call the number. This is inserted to demo functionality
                // since the Simulator cannot make a phone call. This line will print a string to the console.
                print("The phone is calling my number. Voicemail will be triggered automatically.")
            }
        }
    
    // #29.2
    @IBAction func skillsButtonTapped(_ sender: Any) {
        // #29.3
        showWebPage()
    }
    
    
    // MARK: - Instance methods
    //#28
    // opens a Safari View Controller to specified web page - should be students website, blog, or portfolio
    func showWebPage() {
        // #28.1
        // students web page, blog, portfolio entered as a string below
        let urlString = "https://www.swiftteacher.org"

        if let url = URL(string: urlString) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let view = SFSafariViewController(url: url, configuration: config)
            view.delegate = self
            present(view, animated: true)
        }
    }
    

}


//
//  ResumeViewController.swift
//  MyResume
//
//  Created by Brian Foutty on 5/6/21.
//
// #33.9
import PDFKit
import UIKit

class ResumeViewController: UIViewController {
    // MARK: Instance Properties
    
    // This creates a value for and stores the location of your resume in your app so that we can locate it later for the share button.
    // #34
    let resume = Bundle.main.url(forResource: "MyResume_project_example", withExtension: "pdf")
    // #35
    // creates a PDFview that uses the PDFView class to gain access to all of the PDFKit framework functionality.
    let pdfView = PDFView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // #41
        // Adds a title to the navigation bar. We will set the large title to false so that the title is not jarring and does not take away from the presentation of your resume.
        title = "Your Name"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        // #40
        // Adds the share button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        // #36
        // needs to be false or pdf may not show in the view
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        // adds the pdfView to your view
        view.addSubview(pdfView)
        
        // #36
        // Unwraps an this optional value and if it finds nil inside it exits.
        guard let path = Bundle.main.url(forResource: "MyResume_project_example", withExtension: "pdf") else { return }
        
        // Unwraps this optional value. If there is a value our document will load, if nil the loop exits.
        guard let document = PDFDocument(url: path) else {return}
        
        pdfView.document = document
    }
    
    // #38
    // An Objective-C function that will be called when the share button is tapped.
    @objc func shareTapped() {
        // #39
        // Unwraps the resume doc (just in case there is no document to be loaded) and if there is no document it will exit
        guard let document = resume else { return }
        // Creates a message to be shared with your resume
        let message = "This is Brian Foutty's resume. It looks great. Doesn't it make you want to offer him the job."
        // Creates the share view that shares the loads the array of items to be shared - in this case your resume and your message for the interviewer.
        let view = UIActivityViewController(activityItems: [document, message], applicationActivities: [])
        // Shows the view as a popover from a rightBarButtonItem
        view.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        // presents the view when the share button is tapped
        present(view, animated: true)
    }
    
    // #37
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = view.bounds
    }
}

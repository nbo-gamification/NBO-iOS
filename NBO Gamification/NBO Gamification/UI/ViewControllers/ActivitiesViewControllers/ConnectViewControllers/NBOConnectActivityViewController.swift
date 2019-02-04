//
//  NBOConnectActivityViewController.swift
//  NBO Gamification
//
//  Created by dante on 02/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

class NBOConnectActivityViewController: UIViewController {

    var delegate: NBOActivityViewControllerDelegate?
    
    struct ViewData {
        var connectActivity: NBOConnectActivity?
    }

    var viewData: ViewData?

    // MARK: Outlets/IBActions
    
    @IBOutlet weak var question: UILabel! {
        didSet {
            question.text = self.viewData?.connectActivity?.instructions
        }
    }

    @IBOutlet weak var instructions: UILabel! {
        didSet {
            instructions.text = self.viewData?.connectActivity?.description
        }
    }

    @IBOutlet weak var answer: UITextField!

    @IBOutlet var exit: UIBarButtonItem! {
        didSet {
            exit.title = "Exit"
        }
    }
    @IBAction func exitButtonSelected(_ sender: UIBarButtonItem) {
        delegate?.viewControllerDidExit(self)
    }
    
    @IBOutlet var skip: UIBarButtonItem! {
        didSet {
            skip.title = "Skip"
        }
    }
    @IBAction func skipButtonSelected(_ sender: Any) {
        delegate?.viewControllerDidSkip(self)
    }

    @IBOutlet weak var submitButton: UIButton! {
        didSet {
            submitButton.cornerRadius = 5
        }
    }
    @IBAction func submitButtonSelected(_ sender: Any) {
        delegate?.viewControllerDidSelectSubmitButton(self, answer: answer.text ?? "")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = exit
        self.navigationItem.rightBarButtonItem = skip
    }
}

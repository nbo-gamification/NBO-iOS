//
//  NBOConnectActivityViewController.swift
//  NBO Gamification
//
//  Created by dante on 02/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

protocol NBOConnectActivityViewControllerDelegate: class {
    func viewControllerDidSelectSubmitButton(_ connectVC: NBOConnectActivityViewController, answer: String)
    func viewControllerDidSkip(_ connectVC: NBOConnectActivityViewController)
}

class NBOConnectActivityViewController: UIViewController {

    var delegate: NBOConnectActivityViewControllerDelegate?
    struct ViewData {
        var connectActivity: NBOConnectActivity?
    }

    var viewData: ViewData?

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

    override func viewDidLoad() {
        super.viewDidLoad()

    self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.rightBarButtonItem = skip

    }
}

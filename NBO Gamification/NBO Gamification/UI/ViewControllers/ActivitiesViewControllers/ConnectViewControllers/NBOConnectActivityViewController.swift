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
    

    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var connectImage: UIImageView!

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
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.leftBarButtonItem = exit
        self.navigationItem.rightBarButtonItem = skip
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        scrollView.layoutSubviews()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func keyboardWillAppear(notification: NSNotification) {

        let keyBoardSize = ScrollViewHelper.getKeyboardSize(notification: notification, view: view)
        let positionToScroll = CGPoint(x: 0, y: self.connectImage.frame.height)
        self.scrollView.adjustBottomScrollInstestsAndPosition(bottomIndicatorInsets: keyBoardSize, bottomContentInsets: keyBoardSize, shouldScrollToPosition: positionToScroll)
    }

    @objc func keyboardWillDisappear() {
        if scrollView.contentInset.bottom != 0 {
            self.scrollView.adjustBottomScrollInstestsAndPosition(bottomIndicatorInsets: 0, bottomContentInsets: 0, shouldScrollToPosition: CGPoint(x: 0, y: 0))
        }
    }
}

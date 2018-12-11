//
//  NBOSUSIViewController.swift
//  NBO Gamification
//
//  Created by dante on 19/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

protocol NBOLoginViewControllerDelegate {
    func viewControllerDidSignIn(_ NBOsusiVC: NBOLoginViewController, email: String, password: String)
}

class NBOLoginViewController: UIViewController {

    var delegate: NBOLoginViewControllerDelegate?

    struct ViewData {
        var email: String
        var password: String
    }

    var viewData: ViewData? {
        didSet {
            guard (self.emailTextField != nil && self.passwordTextField != nil) else { return }
            if oldValue?.email != viewData?.email {
                self.emailTextField.text = viewData?.email
            }
            if oldValue?.password != viewData?.password {
                self.passwordTextField.text = viewData?.password
            }
        }
    }

    public enum ErrorMessages {
        case emailNotAllowed
        case incorrectEmailOrPassword
    }

    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.cornerRadius = 5
        }
    }
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.text = viewData?.email
        }
    }
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailErrorMessage: UILabel!

    @IBOutlet weak var emailOrPasswordErrorMessage: UIView!
    @IBAction func signIn(_ sender: Any) {
        if isValidEmail(email: emailTextField.text) != true {
            showEmailErrorMessageAnimated(errorToShow: ErrorMessages.emailNotAllowed)
            return
        }
        delegate?.viewControllerDidSignIn(self, email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }

    func isValidEmail(email: String?) -> Bool {
        guard let email = email else {return false}
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }

    func showEmailErrorMessageAnimated(errorToShow: ErrorMessages) {

        UIView.animate(withDuration: 1, animations: {
            switch errorToShow {
            case .emailNotAllowed:
                self.emailErrorMessage.alpha = 1
            case .incorrectEmailOrPassword:
                self.emailOrPasswordErrorMessage.alpha = 1
            }
        }, completion: {_ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
                UIView.animate(withDuration: 2, animations: {
                    self.emailErrorMessage.alpha = 0
                    self.emailOrPasswordErrorMessage.alpha = 0
                })
            })
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

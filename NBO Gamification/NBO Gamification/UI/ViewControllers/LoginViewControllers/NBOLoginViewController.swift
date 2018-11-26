//
//  NBOSUSIViewController.swift
//  NBO Gamification
//
//  Created by dante on 19/11/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

protocol NBOLoginViewControllerDelegate {
    func viewControllerDidSignIn(_ NBOsusiVC: NBOLoginViewController)
}

class NBOLoginViewController: UIViewController {

    var delegate: NBOLoginViewControllerDelegate?

    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.cornerRadius = 5
        }
    }

    @IBAction func signIn(_ sender: Any) {
        delegate?.viewControllerDidSignIn(self)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

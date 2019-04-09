//
//  ViewController.swift
//  Calculator
//
//  Created by yongcong yu on 3/24/31 H.
//  Copyright © 31 Heisei yongcong yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var inputUser: UITextField!
    @IBOutlet weak var inputPass: UITextField!
    var userID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginPresenter.initUser()
    }
    
    @IBAction func onClickLogin(_ sender: UIButton) {
        self.userID = LoginPresenter.auth(inputUser.text ?? "", inputPass.text ?? "")
        
        if(userID != ""){
            self.performSegue(withIdentifier: "login", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login" {
            let secondViewController: Page2ViewController = segue.destination as! Page2ViewController
            secondViewController.userID = self.userID
        }
    }
}


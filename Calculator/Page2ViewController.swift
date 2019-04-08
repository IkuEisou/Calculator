//
//  Page2ViewController.swift
//  Calculator
//
//  Created by yongcong yu on 4/6/31 H.
//  Copyright © 31 Heisei yongcong yu. All rights reserved.
//

import UIKit

class Page2ViewController: UIViewController {

    @IBOutlet weak var displayer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func clear(_ sender: UIButton) {
        self.displayer.text = "0"
    }
    
    @IBAction func numberOnclick(_ sender: UIButton) {
        let num = sender.titleLabel?.text
        var before =  self.displayer.text
        
        if(before == "0"){
            before = ""
        }

        self.displayer.text = "\(before ?? "")\(num ?? "")"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

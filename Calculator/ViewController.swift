//
//  ViewController.swift
//  Calculator
//
//  Created by yongcong yu on 3/24/31 H.
//  Copyright © 31 Heisei yongcong yu. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet weak var inputUser: UITextField!
    @IBOutlet weak var inputPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //使用默认的数据库
        do {
            let realm = try Realm()
        //查询所有的记录
        let users = realm.objects(User.self)
        //已经有记录的话就不插入
        if users.count>0 {
            return
        }
        
        //初始化用户
        let userDefault = User()
                
        // 数据持久化操作
        try! realm.write {
            realm.add(userDefault)
        }
        
        //打印出数据库地址
        print(realm.configuration.fileURL ??  "No database")
        } catch let error as NSError {
            print(error.localizedFailureReason ?? "Unkowned Error")
        }

        }

    @IBAction func onClickLogin(_ sender: UIButton) {
        //使用默认的数据库
        let realm = try! Realm()
        //查询所有的记录
        let users = realm.objects(User.self)
        
        if users.count>0 {
            let defName = users[0].name
            let defPass = users[0].passwd
            
            if(inputUser.text == defName &&
                inputPass.text == defPass){
                self.performSegue(withIdentifier: "login", sender: self)
            }
        }
    }
    
}


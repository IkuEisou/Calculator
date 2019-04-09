//
//  LoginPresenter.swift
//  Calculator
//
//  Created by yongcong yu on 2019/04/09.
//  Copyright © 2019 yongcong yu. All rights reserved.
//

import Foundation
import RealmSwift

class LoginPresenter{
    static func initUser() {
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
                realm.add(userDefault, update: true)
            }
            
            //打印出数据库地址
            print("数据库地址：%S", realm.configuration.fileURL ??  "No database")
        } catch let error as NSError {
            print(error.localizedFailureReason ?? "Unkowned Error")
        }
    }
    
    static func auth(_ user: String, _ pass: String) -> String{
        //使用默认的数据库
        let realm = try! Realm()
        //查询所有的记录
        let users = realm.objects(User.self)
        
        if users.count>0 {
            let defName = users[0].name
            let defPass = users[0].passwd
            
            if(user == defName && pass == defPass){
                return users[0].id
            }
        }
        
        return "";
    }
    
}

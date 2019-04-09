//
//  User.swift
//  Calculator
//
//  Created by yongcong yu on 3/30/31 H.
//  Copyright © 31 Heisei yongcong yu. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    //用户ID
    @objc dynamic var id = "000";
    
    //用户名
    @objc dynamic var name = "test";
    
    //密码
    @objc dynamic var passwd = "001";
    
    //设置主键
    override static func primaryKey() -> String? {
        return "id"
    }
}

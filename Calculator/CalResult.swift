//
//  CalResult.swift
//  Calculator
//
//  Created by yongcong yu on 2019/04/09.
//  Copyright © 2019 yongcong yu. All rights reserved.
//

import Foundation
import RealmSwift

class CalResult: Object{
    //用户ID
    @objc dynamic var id = "000";
    
    //計算結果
    @objc dynamic var res = "0";
    
    //设置主键
    override static func primaryKey() -> String? {
        return "id"
    }
}

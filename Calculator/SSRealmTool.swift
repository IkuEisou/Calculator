//
//  SSRealmTool.swift
//  Calculator
//
//  Created by yongcong yu on 4/3/31 H.
//  Copyright © 31 Heisei yongcong yu. All rights reserved.
//

import Foundation
import RealmSwift

class SSRealmTool {
    
    /// 数据库版本号
    static var schemaVersion: UInt64 = 0
    
    /// 唯一的数据库操作的 Realm
    static let ss_realm = realm()
    
    /// 获取数据库操作的 Realm
    private static func realm() -> Realm {
        
        // 获取数据库文件路径
        let fileURL = URL(string: NSHomeDirectory() + "/Documents/demo.realm")
        // 在 APPdelegate 中需要配置版本号时，这里也需要配置版本号
        let config = Realm.Configuration(fileURL: fileURL, schemaVersion: schemaVersion)
        
        return try! Realm(configuration: config)
    }
    
}

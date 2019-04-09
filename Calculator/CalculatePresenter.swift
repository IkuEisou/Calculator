//
//  CalculatePresenter.swift
//  Calculator
//
//  Created by yongcong yu on 2019/04/09.
//  Copyright © 2019 yongcong yu. All rights reserved.
//

import Foundation
import RealmSwift

class CalculatePresenter{
    static func saveResult(_ res: String, _ usrID: String){
        //使用默认的数据库
        let realm = try! Realm()
        if(realm.objects(CalResult.self).filter("id = %s", usrID).count == 0){
            let resObj = CalResult()
            
            resObj.id = usrID
            resObj.res = res
            
            // insert
            try! realm.write {
                realm.add(resObj)
            }
        }else{
            //update
            try! realm.write {
                realm.object(ofType: CalResult.self, forPrimaryKey: usrID)?.res = res
            }
        }
    }
    
    static func getResult(usrID: String) -> String{
        let realm = try! Realm()
        return realm.object(ofType: CalResult.self, forPrimaryKey: usrID)?.res ?? "0"
    }
    
    static func delResult(_ res: String, _ usrID: String){
        //使用默认的数据库
        let realm = try! Realm()
        
        try! realm.write {
            realm.delete(realm.object(ofType: CalResult.self, forPrimaryKey: usrID)!)
        }
    }
}

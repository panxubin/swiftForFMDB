//
//  FMDBModel.swift
//  FMDBDemo
//
//  Created by panxubin on 16/2/24.
//  Copyright © 2016年 xiaoming. All rights reserved.
//

import UIKit

class FMDBModel: NSObject {

    ///属性
    var png : String?
    var text : String?
    
    init(dict : [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) { }
    
    ///给一个插入
    func insert(){
        
        let sql = "INSERT INTO 't_emotion' ('png', 'text') values ('\(self.png!)', '\(self.text!)')"
        ///下面第一种写法存在线程不安全的问题
//       try! FMDBManager.ShareManager.db?.executeUpdate(sql, values: [])
        
        ///下面的写法是线程安全的写法
    FMDBQueueManager.shareFMDBQueueManager.dbQueue?.inDatabase({ (db) ->Void in
            
            try! db.executeUpdate(sql, values: [])
        })
    }
    
    func delete(){
        let sql = ""
    FMDBQueueManager.shareFMDBQueueManager.dbQueue?.inDatabase({ (db) -> Void in
            try! db.executeUpdate(sql, values: [])
        })
    }
    
    func update(){
        let sql = ""
        FMDBQueueManager.shareFMDBQueueManager.dbQueue?.inDatabase({ (db) -> Void in
            try! db.executeUpdate(sql, values: [])
        })
    }
    
    ///查询数据
    class func query() -> [[String : AnyObject]]{
        
        let sql = "SELECT * FROM t_emotion"
        var resultArray: [[String : AnyObject]] = []
        
    FMDBQueueManager.shareFMDBQueueManager.dbQueue?.inDatabase({ (db)->Void in
        
           ///执行查询
            if let result = try? db.executeQuery(sql, values: []){
            ///简历查询后的数据
                while result.next(){
                    ///获取数据
                let png = result.stringForColumn("png")
                let text = result.stringForColumn("text")
                    let dict = ["png": png, "text": text]
                    resultArray.append(dict)
                }
            }
        })
        ///查找到数据后将数据返回
        return resultArray
    }
}

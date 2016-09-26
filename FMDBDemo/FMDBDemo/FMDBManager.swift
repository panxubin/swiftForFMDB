//
//  FMDBManager.swift
//  FMDBDemo
//
//  Created by panxubin on 16/2/24.
//  Copyright © 2016年 xiaoming. All rights reserved.
//

import UIKit
import FMDB

class FMDBManager: NSObject {

    ///单例
    static let ShareManager = FMDBManager()
    
    ///创建一个dataBase的一个全局对象
    var db : FMDatabase?
    
    func openDB(dbName : String){
        ///给路径后面加一个!，强制创建
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last!
        
        print(path)
        
        ///创建一个dbBase的数据库的对象
        db = FMDatabase(path: "\(path)/\(dbName)")
        
        ///判断是否创建成功,需要强制解包
        if db!.open() {
            print("数据库创建成功")
            creatTable()
        }else{
            print("数据库创建失败")
        }
    }
    
    ///创建表的方法
    func creatTable(){
        
        ///创建表
        let sql = "CREATE TABLE IF NOT EXISTS t_emotion ('id' integer NOT NULL,'png' text NOT NULL,'text' text NOT NULL,PRIMARY KEY('id'))"
        
        ///进行错误处理
        do{
            
           try db?.executeUpdate(sql, values: [])
           print("创建表成功")
        }catch{
        
            print(error);
        }
    }
    
}

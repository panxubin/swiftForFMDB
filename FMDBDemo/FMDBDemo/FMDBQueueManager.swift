//
//  FMDBQueueManager.swift
//  FMDBDemo
//
//  Created by panxubin on 16/2/24.
//  Copyright © 2016年 xiaoming. All rights reserved.
//

import UIKit
import FMDB

class FMDBQueueManager: NSObject {

    static let shareFMDBQueueManager = FMDBQueueManager()
    
    var dbQueue : FMDatabaseQueue?
    
    func openDB(dbName : String){
        
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last!
        print(path)
        dbQueue = FMDatabaseQueue(path: "\(path)/\(dbName)")
        
        createTable()
    }
    
    func createTable () {
        let sql = "CREATE TABLE IF NOT EXISTS t_emotion ('id' integer NOT NULL,'png' text NOT NULL,'text' text NOT NULL,PRIMARY KEY('id'))"
        dbQueue?.inDatabase({ (db) -> Void in
            try! db.executeUpdate(sql, values: [])
        })
    }
    
}


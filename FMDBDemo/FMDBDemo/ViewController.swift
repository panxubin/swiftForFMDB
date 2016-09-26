//
//  ViewController.swift
//  FMDBDemo
//
//  Created by panxubin on 16/2/24.
//  Copyright © 2016年 xiaoming. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        insert()
        query()
    }

    func insert(){
        
        for i in 0...100 {
            let emotion = FMDBModel(dict: ["png" : "啊啊啊哈\(i).png","text": "hahh\(i)"])
            emotion.insert()
        }
    }
 
    func query(){
        let dataArray = FMDBModel.query()
        print(dataArray)
    }
}


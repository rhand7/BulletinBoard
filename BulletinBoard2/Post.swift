//
//  Post.swift
//  BulletinBoard2
//
//  Created by handje on 4/25/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import Foundation

struct Post {
    
    let body: String
    let date: Date
    
    init(body: String, date: Date = Date()) {
        self.body = body
        self.date = date 
    }
    
}

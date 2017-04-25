//
//  Post+CloudKit.swift
//  BulletinBoard2
//
//  Created by handje on 4/25/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import Foundation
import CloudKit

extension Post {
    
    // 1. CKRecrod is a key-value pair, so we want keys to be able to access the values
    
    static var kBody: String { return "Body" }
    static var kDate: String { return "Date" }
    static var RecordType: String { return "Post" }
    
    // 3. Create a Post from a CKRecord
    
    init?(cloudKitRecord: CKRecord) {
        // guard let body = cloudKitRecord[Post.kBody] as? String,
        guard let body = cloudKitRecord.object(forKey: Post.kBody) as? String,
            let date = cloudKitRecord.object(forKey: Post.kDate) as? Date,
            cloudKitRecord.recordType == Post.RecordType else { return nil }
        
        self.body = body
        self.date = date
    }
    
    
    
    // 2. Create a CKRecord from a Post
    
    // dictionaryRep
    // var dictionaryRep: [String: Any] {
    //     return [Post.kBody: body, Post.kDate: date] 
    
    // CloudKit representation
    
    var cloudKitRecord: CKRecord {
        let record = CKRecord(recordType: Post.RecordType)
        // record[Post.kBody] = body as CKRecordValue
        record.setObject(body as CKRecordValue, forKey: Post.kBody)
        record.setObject(date as CKRecordValue, forKey: Post.kDate)
        return record
    }
}

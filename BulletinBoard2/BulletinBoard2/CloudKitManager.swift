//
//  CloudKitManager.swift
//  BulletinBoard2
//
//  Created by handje on 4/25/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import Foundation
import CloudKit

class CloudKitManager {
    
    let database = CKContainer.default().publicCloudDatabase
    
    // Fetch
                                            // = nil allows this code to be reusable either sort or not
    func fetchRecords(ofType type: String, sortDescriptors: [NSSortDescriptor]? = nil, completion: @escaping ([CKRecord]?, Error?) -> Void) {
        let query = CKQuery(recordType: type, predicate: NSPredicate(value: true))
        query.sortDescriptors = sortDescriptors    //equal to itself so we can reuse code w/ other types in our controller
        
        database.perform(query, inZoneWith: nil, completionHandler: completion) //calls all queries
    }
    
    // Save
    
    func save(_ record: CKRecord, completion: @escaping (Error?) -> Void) {
        self.database.save(record) { (record, error) in
            completion(error)
        }
    }
    
}

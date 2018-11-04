//
//  Activity.swift
//  selfiegram_app
//
//  Created by Alvin Phun on 2018-10-27.
//  Copyright © 2018 Alvin Phun. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Activity: PFObject, PFSubclassing {
    
    @NSManaged var type:String
    @NSManaged var post:Post
    @NSManaged var user:PFUser
    
    static func parseClassName() -> String {
        // sets what the table name on Parse will be called
        return "Activity"
    }
    
    
    convenience init(type:String, post: Post, user:PFUser) {

        self.init()
        self.type = type
        self.post = post
        self.user = user
    }
}


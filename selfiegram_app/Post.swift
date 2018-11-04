//
//  Post.swift
//  selfiegram_app
//
//  Created by Alvin Phun on 2018-10-03.
//  Copyright © 2018 Alvin Phun. All rights reserved.
//

import Foundation
import UIKit
import Parse

class Post: PFObject, PFSubclassing {
    
    @NSManaged var image:PFFile
    @NSManaged var user:PFUser
    @NSManaged var comment:String
    
    static func parseClassName() -> String {
        // sets what the table name on Parse will be called
        return "Post"
    }
    
    var likes: PFRelation<PFObject>! {
        // PFRelations are a bit different from just a regular properties
        // This is called a 'computed property' because it's value is computed every time instead of stored.
        // This line below specifies that our relation column on Parse should be called 'likes'
        return relation(forKey: "likes")
    }
    
    // Every user will have three properties: 1) the selfie image, 2) the user that posted the selfie and 3) a comment from the poster of the selfie.
//    let imageURL:URL
//    let user:User
//    let comment:String
    
    // convenience init method, because it is building on top of PFObject's init, rather than overriding it.
    convenience init(image:PFFile, user:PFUser, comment:String) {
        // You can name the property you are passing into the function the same name as the class' property. To distinuish the two, add 'self.' to the beginning of the class' property
        self.init()
        self.image = image
        self.user = user
        self.comment = comment
    }
}

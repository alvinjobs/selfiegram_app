//
//  User.swift
//  selfiegram_app
//
//  Created by Alvin Phun on 2018-10-03.
//  Copyright © 2018 Alvin Phun. All rights reserved.
//

import Foundation
import UIKit

class User {
    let username:String
    let profileImage:UIImage
    
    init(usernameParam: String, profileImageParam: UIImage) {
        username = usernameParam
        profileImage = profileImageParam
    }
}

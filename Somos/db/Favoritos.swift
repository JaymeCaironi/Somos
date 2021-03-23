//
//  Favoritos.swift
//  Somos
//
//  Created by Jayme Antonio da Rosa Caironi on 16/03/21.
//

import Foundation

class Favoritos {

    var id: Int = 0
    var login: String?
    var avatar_url: String?
    var name: String?

    init(dictionary: [String: Any], id:Int) {
        self.id = id
        self.login = dictionary["login"] as? String
        self.avatar_url = dictionary["avatar_url"] as? String
        self.name = dictionary["name"] as? String

    }
    
}


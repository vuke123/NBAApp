//
//  Team.swift
//  NBA App
//
//  Created by Luka Vukelić on 30.05.2022..
//

import Foundation
 
import Foundation

struct Team: Decodable{
    var id: Int
    var abbreviation: String
    var full_name: String
    var city: String
    var conference: String
    var division: String
}

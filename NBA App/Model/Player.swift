//
//  Player.swift
//  NBA App
//
//  Created by Luka Vukelić on 30.05.2022..
//

import Foundation

struct Player: Decodable{
    var id: Int
    var first_name: String
    var last_name: String
    var height_feet: Int
    var height_inches: Int
    var position: String
    var team: Team
    var weight: Int
    
}

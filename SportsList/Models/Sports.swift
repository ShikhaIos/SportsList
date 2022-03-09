//
//  Sports.swift
//  SportsList
//
//  Created by shikha on 07/03/22.
//

import Foundation


struct Sports : Decodable {
    var data : [SportsData]
}

struct SportsData : Decodable {
    var id:Int?
    var type:String?
    var attributes:SportAttribute?
    var relationships : SportsRelationShip?
}

struct SportAttribute : Decodable {
    
    var name:String?
    var description:String?
    
        enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
       }
}

struct SportsRelationShip : Decodable {
    var images : SportsImage?
    
}


struct SportsImage : Decodable {
    var data : [ImageUrl]
}

struct ImageUrl : Decodable {
    var url : String?
    
    enum CodingKeys: String, CodingKey {
    case url = "url"
   }
}

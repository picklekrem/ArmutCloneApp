//
//  HomeModel.swift
//  ArmutCloneApp
//
//  Created by Ekrem Özkaraca on 20.03.2022.
//

import Foundation

struct Home : Decodable {
    var all_services : [ServicesModel]?
    var popular : [ServicesModel]?
    var posts : [PostModel]?
}

struct ServicesModel : Decodable {
   let id : Int?
   let service_id : Int?
   let name : String?
   let long_name : String?
   let image_url : String?
   let pro_count : Int?
}

struct PostModel : Decodable {
    let title : String
    let category : String
    let image_url : String
    let link : String
}

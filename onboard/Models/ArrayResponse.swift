//
//  ArrayObject.swift
//  onboard
//
//  Created by admin on 09/05/2024.
//

import Foundation
import ObjectMapper

class ArrayResponse<T: Mappable>: Mappable {
    var page: Int = 1
    var totalResults: Int = 0
    var totalPages: Int = 0
    var results: [T] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        page                <- map["page"]
        totalResults        <- map["total_results"]
        totalPages          <- map["total_pages"]
        results             <- map["results"]
    }
}

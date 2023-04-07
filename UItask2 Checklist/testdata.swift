//
//  testdataParser.swift
//  UItask2 Checklist
//
//  Created by mayank ranka on 28/03/23.
//

import UIKit

class testdataParser: NSObject {
    var title            : String?
    var shortDescription : String?
    var collectedValue   : Int?
    var totalValue       : Int?
    var mainImageURL     : String?
    
     
    init(dictionary : [String : Any]) {
        super.init()
        title            = dictionary["title"] as? String
        shortDescription = dictionary["shortDescription"] as? String
        collectedValue   = dictionary["collectedValue"] as? Int
        totalValue       = dictionary["totalValue"] as? Int
        mainImageURL     = dictionary["mainImageURL"] as? String
    }
}

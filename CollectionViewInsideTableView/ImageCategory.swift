//  ImageCategory.swift
//  EnActSystemTask
//  Created by Ranjeet Raushan on 18/11/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import Foundation
struct CategoryConstants {
    static let category_ID = "cat_id"
    static let category_Description = "cat_description"
    static let category_Name = "cat_name"
    static let category_Items = "cat_items"
}


class ImageCategory {
    let name:String?
    let catId:String?
    let catDescription:String?
    var cayegoryItems:[String]? 
    init(withInfo infoDict:[String:Any]) {
        self.name = infoDict[CategoryConstants.category_Name] as? String
        self.catId = infoDict[CategoryConstants.category_ID] as? String
        self.catDescription = infoDict[CategoryConstants.category_Description] as? String
        self.cayegoryItems = infoDict[CategoryConstants.category_Items] as? [String]
    }
}

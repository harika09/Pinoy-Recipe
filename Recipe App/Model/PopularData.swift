//
//  Popular.swift
//  Recipe App
//
//  Created by Harold Abella on 8/22/20.
//

import Foundation

struct PopularData: Codable, Hashable{
    var title: String
    var headline: String
    var image: String
    var rating: String
    var serves: String
    var preparation: String
    var cooking: String
    var instructions: [String]
    var ingredients: [String]
    
}

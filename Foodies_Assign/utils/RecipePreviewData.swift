//
//  RecipePreviewData.swift
//  Foodies_Assign
//
//  Created by Satoshi Mitsumori on 10/19/24.
//

import Foundation

var recipePreviewData: RecipeModel = loadJsonFile(filename: "recipeJson.json")

private func loadJsonFile<dataloaded: Decodable>(filename: String) -> dataloaded {
    let jsonData: Data
    
    guard let jsonfile = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        jsonData = try Data(contentsOf: jsonfile)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let jsondecoder = JSONDecoder()
        return try jsondecoder.decode(dataloaded.self, from: jsonData)
    } catch {
        fatalError("Couln't parse \(filename) as \(dataloaded.self) \n: \(error)")
    }
}

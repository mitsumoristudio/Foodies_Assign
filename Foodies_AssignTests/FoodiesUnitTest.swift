//
//  FoodiesUnitTest.swift
//  Foodies_AssignTests
//
//  Created by Satoshi Mitsumori on 10/19/24.
//

import Foundation
import XCTest
@testable import Foodies_Assign

final class FoodiesUnitTest: XCTestCase {
    
    func test_with_valid_json_successfully_decodes() {
        
        XCTAssertNoThrow(try StaticJSONMapping.decode(file: "recipeJson", type: RecipeModel.self), "Mapping should not throw an error")
        
        // MARK: Check if the recipe response is not nil
        let recipeResponse = try? StaticJSONMapping.decode(file: "recipeJson", type: RecipeModel.self)
        
        XCTAssertNotNil(recipeResponse, "Recipe Response should not be nil")
        
        // MARK: Check if the data in the array of recipes, the dictionary matches the actual string
        XCTAssertEqual(recipeResponse?.recipes.count, 65, "There should be 65 recipes")
        
        XCTAssertEqual(recipeResponse?.recipes[0].cuisine,"Malaysian", "Cuisine should be Malaysian")
        
        XCTAssertEqual(recipeResponse?.recipes[0].name, "Apam Balik", "Dish name should be Apam Balik")
        
        XCTAssertEqual(recipeResponse?.recipes[0].photourllarge, "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg", "Large Image URL")
        
        XCTAssertEqual(recipeResponse?.recipes[0].photourlsmall, "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg", "Small Image URL")
        
        XCTAssertEqual(recipeResponse?.recipes[0].sourceurl, "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                        "Source URL")
        
        XCTAssertEqual(recipeResponse?.recipes[0].uuid, "0c6ca6e7-e32a-4053-b824-1dbf749910d8", "Get the UUID")
        
        XCTAssertEqual(recipeResponse?.recipes[0].youtubeurl, "https://www.youtube.com/watch?v=6R8ffRRJcrg", "Youtube URL")
        
        
        XCTAssertEqual(recipeResponse?.recipes[1].cuisine,"British", "Cuisine should be British")
        
        XCTAssertEqual(recipeResponse?.recipes[1].name, "Apple & Blackberry Crumble", "Dish name should be Apple Blackberry Crumble")
        
        XCTAssertEqual(recipeResponse?.recipes[1].photourllarge, "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg", "Large Image URL")
        
        XCTAssertEqual(recipeResponse?.recipes[1].photourlsmall, "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg", "Small Image URL")
        
        XCTAssertEqual(recipeResponse?.recipes[1].sourceurl, "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
                        "Source URL")
        
        XCTAssertEqual(recipeResponse?.recipes[1].uuid, "599344f4-3c5c-4cca-b914-2210e3b3312f", "get the UUID")
        
        XCTAssertEqual(recipeResponse?.recipes[1].youtubeurl, "https://www.youtube.com/watch?v=4vhcOwVBDO4", "Youtube URL")
        
        XCTAssertEqual(recipeResponse?.recipes[2].cuisine,"British", "Cuisine should be British")
        
        XCTAssertEqual(recipeResponse?.recipes[2].name, "Apple Frangipan Tart", "Dish name should be Apple Frangian Tart")
        
        XCTAssertEqual(recipeResponse?.recipes[2].photourllarge, "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/large.jpg", "Large Image URL")
        
        XCTAssertEqual(recipeResponse?.recipes[2].photourlsmall, "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/small.jpg", "Small Image URL")
        
        XCTAssertEqual(recipeResponse?.recipes[2].uuid, "74f6d4eb-da50-4901-94d1-deae2d8af1d1", "get the UUID")
        
        XCTAssertEqual(recipeResponse?.recipes[2].youtubeurl, "https://www.youtube.com/watch?v=rp8Slv4INLk", "Youtube URL")
        
    }
    
    func test_with_missing_file_error_thrown() {
        XCTAssertThrowsError(try StaticJSONMapping.decode(file: "", type: RecipeModel.self), "An Error should be thrown")
        do {
            _ = try StaticJSONMapping.decode(file: "", type: RecipeModel.self)
        } catch {
            guard let mappingError = error as? StaticJSONMapping.MappingError else {
                XCTFail("This is the wrong type of error for missing files")
                return
            }
            XCTAssertEqual(mappingError, StaticJSONMapping.MappingError.failedToGetContent, "This should be a failed to get content")
        }
    }
    
    func test_with_invalid_file_error_thrown(){
        XCTAssertThrowsError(try StaticJSONMapping.decode(file: "dd", type: RecipeModel.self), "An Error should be thrown")
        
        do {
            _ = try StaticJSONMapping.decode(file: "dd", type: RecipeModel.self)
        } catch {
            guard let mappingError = error as? StaticJSONMapping.MappingError else {
                XCTFail("This is the wrong tupe of error for missing files")
                return
            }
            XCTAssertEqual(mappingError, StaticJSONMapping.MappingError.failedToGetContent, "This should be a failed to get the content")
        }
    }
 
}

//
//  Foodies_AssignTests.swift
//  Foodies_AssignTests
//
//  Created by Satoshi Mitsumori on 10/19/24.
//

import XCTest
@testable import Foodies_Assign

final class Foodies_AssignTests: XCTestCase {
    
    var viewModel: RecipeViewModel
    
    init(viewModel: RecipeViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    
    func testFetchAPI() async throws {
        let data: () = try await viewModel.fetchAllRecipes()
        
        XCTAssertNotNil(data, "Data should not be nil")
        
    }
    
    func testFetchDataInvalidUrl() async throws {
        _ = URL(string: "invalid-url")
        
        do {
            _ = try await viewModel.fetchAllRecipes()
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertNotNil(error, "Error should be thrown for invalid URL")
        }
    }
}
    


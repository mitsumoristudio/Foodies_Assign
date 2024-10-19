//
//  RecipeViewModel.swift
//  Foodies_Assign
//
//  Created by Satoshi Mitsumori on 10/19/24.
//

import Foundation
import SwiftUI


@MainActor
final class RecipeViewModel: ObservableObject {
    var recipes: RecipeModel?
    @Published var filteredRecipes: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var searchTextBox: String = ""
    
    @Published var foodrecipeVM: [Recipe] = []
    
    init() {
    }
    
    func fetchAllRecipes() async throws {
        isLoading = true
        
        guard let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        DispatchQueue.main.async {
            do {
                var result = try? JSONDecoder().decode(RecipeModel.self, from: data)
                
                self.isLoading = false
                
                result?.recipes.sort(by: { r1, r2 in
                    r1.name < r2.name
                })
                
                self.filteredRecipes = result?.recipes ?? []
                
                if let result = result {
                    result.recipes.forEach { items in
                        print(items.name)
                        
                        print(items.cuisine)
                    }
                }
                self.recipes = result
                
            } catch let error {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func filterData(query: String) {
        if(query.isEmpty) {
            self.filteredRecipes = self.recipes?.recipes ?? []
        }
        else{
            self.filteredRecipes = self.recipes?.recipes.filter{ recipe in
                recipe.cuisine.lowercased().contains(query.lowercased())
            } ?? []
        }
    }
}


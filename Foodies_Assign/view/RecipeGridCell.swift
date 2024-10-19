//
//  RecipeGridCell.swift
//  Foodies_Assign
//
//  Created by Satoshi Mitsumori on 10/19/24.
//

import SwiftUI
import Kingfisher

struct RecipeGridCell: View {
    @State var recipes: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center, spacing: 12) {
                
                if let imageURLString = recipes.photourlsmall  {
                    KFImage(URL(string: imageURLString))
                        .loadDiskFileSynchronously()
                        .resizable()
                        .diskCacheExpiration(StorageExpiration.days(90))
                        .fade(duration: 0.25)
                        .placeholder({
                            //   ProgressView()
                            Image(systemName: "checkmark.circle.badge.questionmark")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 400, height: 200)
                                .clipShape(Circle())
                        })
                    // Disk Cache expiration ->
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: Color.primary.opacity(0.25), radius: 10)
                        .overlay(alignment: .bottom) {
                            VStack() {
                                
                                Text(recipes.name)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .shadow(color: .black, radius: 10, x: 0, y: 0)
                                    .frame(maxWidth: 136)
                                    .padding()
                                
                                Text(recipes.cuisine)
                                    .font(.title3)
                                    .foregroundColor(Color.white)
                                    .shadow(color: .black, radius: 10, x: 0, y: 0)
                                    .frame(maxWidth: 136)
                                    .padding()
                                
                            }
                        }
                }
            }
        }
    }
}

struct RecipeGridCell_Preview: PreviewProvider {
    
    static var previews: some View {
        let mockRecipes = Recipe(cuisine: "Malaysian", name: "Apam Balik", uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8", photourllarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg", photourlsmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg", sourceurl: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ", youtubeurl: "https://www.youtube.com/watch?v=6R8ffRRJcrg", id: 1)
        
        RecipeGridCell(recipes: mockRecipes)

    }
}


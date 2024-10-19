//
//  RecipeDetailCell.swift
//  Foodies_Assign
//
//  Created by Satoshi Mitsumori on 10/19/24.
//

import SwiftUI
import Kingfisher

struct RecipeDetailCell: View {
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
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                        })
                    // Disk Cache expiration ->
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .opacity(0.95)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 0)
                    
                } else {
                    Image(systemName: "questionmark.square.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(recipes.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.black)
                    
                    
                    Text(recipes.cuisine)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.blue)
                    
                }
               
            }
            .padding(.horizontal, 10)
        }
    
    }
}

struct RecipeDetailCell_Preview: PreviewProvider {
    
    static var previews: some View {
        let mockRecipes = Recipe(cuisine: "Malaysian", name: "Apam Balik", uuid: "0c6ca6e7-e32a-4053-b824-1dbf749910d8", photourllarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg", photourlsmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg", sourceurl: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ", youtubeurl: "https://www.youtube.com/watch?v=6R8ffRRJcrg", id: 1)
        
        
        RecipeDetailCell(recipes: mockRecipes)
    }
}



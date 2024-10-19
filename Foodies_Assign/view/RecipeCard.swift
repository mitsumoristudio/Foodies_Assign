//
//  RecipeCard.swift
//  Foodies_Assign
//
//  Created by Satoshi Mitsumori on 10/19/24.
//

import Foundation
import SwiftUI
import Kingfisher

struct RecipeCard: View {
    @State var recipes: Recipe
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
               VStack(alignment: .leading, spacing: 12) {
                    
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
                                    .frame(width: 420, height: 300)
                                    .shadow(radius: 5)
                                    .clipShape(Circle())
                            })
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 420)
                            .frame(maxHeight: 300)
                            .shadow(radius: 10)
                            .clipShape(Circle())
                            .padding(.vertical, 40)
                    }
                    
                   VStack(alignment: .center) {
                       Text("Dish: \(recipes.name)")
                           .font(.title2)
                           .fontWeight(.black)
                           .padding(.bottom, 10)
                       
                       Text("Cuisine: \(recipes.cuisine)")
                           .font(.title3)
                           .fontWeight(.semibold)
                           .padding(.bottom, 10)
                   }
                   .padding(.horizontal, 20)
                }
                .padding()
            }
            .ignoresSafeArea(.all, edges: .top)
            .navigationBarBackButtonHidden(true)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                    
                } label: {
                    Image(systemName: "chevron.backward.circle")
                        .foregroundColor(Color.white)
                        .background(Color.black, in: Circle())
                        .font(.title)
                }

            }
            ToolbarItem(placement: .navigationBarTrailing, content: {
                IconImage()
            })
        }
    }
}

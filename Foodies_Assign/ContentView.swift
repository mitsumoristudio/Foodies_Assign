//
//  ContentView.swift
//  Foodies_Assign
//
//  Created by Satoshi Mitsumori on 10/19/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewmodel = RecipeViewModel()
    var body: some View {
        VStack {
            RecipesMainView(recipeVM: viewmodel)
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

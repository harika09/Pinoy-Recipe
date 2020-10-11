//
//  ContentView.swift
//  Recipe App
//
//  Created by Harold Abella on 8/22/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
  

    var body: some View {
        TabView{
            Home()
                .tabItem{
                        Image(systemName: "house")
                        Text("Home")
            }
            SearchData()
                .tabItem{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
            }
            AddRecipe()
                .tabItem{
                        Image(systemName: "plus.circle")
                        Text("Add Recipe")
            }

            Favorites()
                .tabItem{
                        Image(systemName: "suit.heart")
                        Text("Favorites")
            }

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

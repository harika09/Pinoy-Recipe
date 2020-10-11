//
//  SearchData.swift
//  Recipe App
//
//  Created by Harold Abella on 8/22/20.
//

import SwiftUI

struct SearchData: View {
    
    func load() -> [PopularData]{
        
        let fileLocation = Bundle.main.url(forResource: "popular", withExtension: "json")!
        let data = try! Data(contentsOf: fileLocation)
        let decoder = JSONDecoder()
        let products = try! decoder.decode([PopularData].self, from: data)
        return products
    }

    @State var text : String = ""
    @State var show = false
    
    var body: some View {
        NavigationView{
            List{
           SearchBar(text: $text)
                ForEach(self.load().filter {self.text.isEmpty ? true :
                    $0.title.lowercased().contains(self.text.lowercased())
                }, id: \.self){ foods in
                    NavigationLink(destination: SearchDetails(recipeDetail: foods)){
                        Search(recipe: foods)
                            .padding(.vertical, 4)
                    }
                   
                }
            }.navigationTitle("Search Foods").font(.system(size: 25))
            
        }
    }
}

struct SearchData_Previews: PreviewProvider {
    static var previews: some View {
        SearchData()
    }
}

//
//  Search.swift
//  Recipe App
//
//  Created by Harold Abella on 8/22/20.
//

import SwiftUI

struct Search: View {
    
    var recipe: PopularData!
    
    var body: some View {
        HStack{
            SearchImageUrl(urlString: recipe.image)
            VStack(alignment: .leading){
                Text(recipe.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .font(Font.system(size: 15))
                Text(recipe.headline)
                    .font(.caption)
                    .foregroundColor(Color.secondary)
                    .lineLimit(4)
            }
                    
            
        } // : HSTACk
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search()
    }
}

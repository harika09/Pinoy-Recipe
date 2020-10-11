//
//  Recommended.swift
//  Recipe App
//
//  Created by Harold Abella on 8/23/20.
//

import SwiftUI

struct Recommended: View {
    
    var recipe: RecommendedData!
    @State private var showModal: Bool = false
    @State var show = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
            PopularImageLoader(urlString: recipe.image)
            VStack(alignment: .leading, spacing: 8){
                Text(recipe.title)
                    .font(Font.system(size: 20))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
                                
            }.padding(.leading)
        }.onTapGesture {
            self.showModal = true
        } .sheet(isPresented: self.$showModal){
            RecommendedDetails(recommended: recipe)
        }
    }
}

struct Recommended_Previews: PreviewProvider {
    static var previews: some View {
        Recommended()
    }
}

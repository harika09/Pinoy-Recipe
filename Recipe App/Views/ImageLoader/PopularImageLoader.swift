//
//  PopularImageLoader.swift
//  Recipe App
//
//  Created by Harold Abella on 8/22/20.
//

import SwiftUI

struct PopularImageLoader: View {
    
    @ObservedObject var urlImageModel: UrlImageModel
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .resizable()
            .frame(width: 240, height: 240, alignment: .leading)
                .cornerRadius(10)
           
    }
    
    static var defaultImage = UIImage(named: "food")
    }

struct PopularImageLoader_Previews: PreviewProvider {
    static var previews: some View {
        PopularImageLoader(urlString: nil)
    }
}

//
//  SearchImageUrl.swift
//  Recipe App
//
//  Created by Harold Abella on 8/22/20.
//

import SwiftUI

struct SearchImageUrl: View {
    
    @ObservedObject var urlImageModel: UrlImageModel
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    
    var body: some View {
        Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 80, alignment: .center)
            .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 3, x: 2, y: 2)
            .cornerRadius(10)
           
    }
    
    static var defaultImage = UIImage(named: "food")
}

struct SearchImageUrl_Previews: PreviewProvider {
    static var previews: some View {
        SearchImageUrl(urlString: nil)
    }
}

//
//  Home.swift
//  Recipe App
//
//  Created by Harold Abella on 8/22/20.
//

import SwiftUI

struct Home: View {
    
    func popularData() -> [PopularData]{
        let filelocation = Bundle.main.url(forResource: "popular", withExtension: "json")!
        let data = try! Data(contentsOf: filelocation)
        let decoder = JSONDecoder()
        let populardata = try! decoder.decode([PopularData].self, from: data)
        
        return populardata
    }
    
    func recommendedData() -> [RecommendedData]{
        let filelocation = Bundle.main.url(forResource: "recommended", withExtension: "json")!
        let data = try! Data(contentsOf: filelocation)
        let decoder = JSONDecoder()
        let recommendeddata = try! decoder.decode([RecommendedData].self, from: data)
        
        return recommendeddata
    }
    
    
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    var date = Date()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                HStack{
                    //MARK: Header
                    VStack(alignment: .leading){
                        Text("Today").font(Font.system(size: 35)).bold()
                        Text("\(date, formatter: Self.taskDateFormat)").font(Font.system(size: 15)).foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action:{
                        
                    }){
                        Image("chef").renderingMode(.original).resizable().frame(width: 40, height: 40, alignment: .trailing)
                    }
                }.padding([.top, .leading, .trailing])
                //MARK: End Header
                
                
                //MARK: Popular
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Popular").font(Font.system(size: 25)).bold()
                        Spacer()
                        Text("View All").bold()
                    }.padding(10)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(popularData().shuffled(), id: \.self){ popular in
                                Popular(recipe: popular)
                               
                            }
                        }.padding()
                    }
                }.padding(2)
                
                
                //MARK: Recommended
                VStack(alignment: .leading){
                    HStack{
                        Text("Recommended").font(Font.system(size: 25)).bold()
                        Spacer()
                        Text("View All").bold()
                    }.padding(10)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(recommendedData().shuffled(), id: \.self){ popular in
                                Recommended(recipe: popular)
                               
                            }
                        }.padding()
                    }
                }.padding(2)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//
//  SearchDetails.swift
//  Recipe App
//
//  Created by Harold Abella on 8/22/20.
//

import SwiftUI

struct SearchDetails: View {
    
    var recipeDetail: PopularData!
    @State private var close: Bool = false
    @State var show = false
    @Environment(\.presentationMode) var presentationMode //Use to Dismiss
    
    var body: some View {
            ScrollView{
                VStack(alignment: .center, spacing: 10){
                    ZStack{
                        UrlImageView(urlString: recipeDetail.image)
                        Button(action:{
                            
                        }){
                            Image(systemName: "suit.heart")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .shadow(radius: 4)
                                .opacity(self.close ? 1 : 0.6)
                                .scaleEffect(self.close ? 1.2 : 0.8, anchor: .center)
                                .animation(Animation.easeOut(duration: 1.5).repeatForever(autoreverses: true))
                        }.padding([.top, .leading, .trailing], 20)
                       
                        Spacer()
                    }
                    Group{
                        //title
                        Text(recipeDetail.title)
                            .font(.system(.largeTitle, design: .serif))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("ColorGreenAdaptive"))
                            .padding(.top,10)
                        
                        //Ingredients
                        Text("Ingredients")
                            .fontWeight(.bold)
                            .modifier(TitleModifier())
                        
                        VStack(alignment: .leading, spacing: 5){
                            ForEach(recipeDetail.ingredients, id: \.self) { ingredients in
                                VStack(alignment: .leading, spacing: 5){
                                    Text(ingredients)
                                        .font(.footnote)
                                        .multilineTextAlignment(.leading)
                                    Divider()
                                        
                                }
                            }
                        }
                        //Instruction
                        Text("Instruction")
                            .fontWeight(.bold)
                            .modifier(TitleModifier())
                        
                        ForEach(recipeDetail.instructions, id: \.self){ instruction in
                            VStack(alignment: .center, spacing: 5){
                                Image(systemName: "chevron.down.circle")
                                    .resizable()
                                    .frame(width: 42, height: 42, alignment: .center)
                                    .imageScale(.large)
                                    .font(Font.title.weight(.ultraLight))
                                    .foregroundColor(Color("ColorGreenAdaptive"))
                                
                                Text(instruction)
                                    .lineLimit(nil)
                                    .multilineTextAlignment(.center)
                                    .font(.system(.body, design: .serif))
                                    .frame(minHeight: 100)
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                }.edgesIgnoringSafeArea(.top)
            }.onAppear(){
                self.close.toggle()
                    
            }
            
            .edgesIgnoringSafeArea(.top)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .overlay(
                VStack(alignment: .leading){
                    Spacer()
                    VStack(alignment: .leading){
                        Button(action:{
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }, label: {
                            Image(systemName: "chevron.left.circle.fill")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .shadow(radius: 4)
                                .opacity(self.close ? 1 : 0.6)
                                .scaleEffect(self.close ? 1.2 : 0.8, anchor: .center)
                                .animation(Animation.easeOut(duration: 1.5).repeatForever(autoreverses: true))
                        })
                        .padding(.leading, 20)
                        .padding(.top, 24)
                        Spacer()
                    }
                },
                alignment: .leading)
    }
}

struct SearchDetails_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetails()
    }
}

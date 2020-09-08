//
//  ItemDetail.swift
//  iDine
//
//  Created by Fábio Salata on 07/09/20.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    @EnvironmentObject var favorite: Favorite
    
    var item: MenuItem
    
    @State private var isFavorite = false
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black.opacity(0.6))
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Button("Order this") {
                self.order.add(item: self.item)
            }
            .font(.headline)
            .padding(10)
            .padding(.horizontal, 10)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Spacer()
        }
        .onAppear(perform: {
            isFavorite = favorite.isFavorite(item: item)
        })
        .navigationBarTitle(Text(item.name), displayMode: .inline)
        .navigationBarItems(trailing:
                                Button(action: {
                                    isFavorite.toggle()
                                    favorite.add(item: item)
                                }, label: {
                                    Image(systemName: isFavorite ? "star.fill" : "star")
                                }))
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ItemDetail(item: MenuItem.example).environmentObject(Order()).environmentObject(Favorite())
        }
    }
}

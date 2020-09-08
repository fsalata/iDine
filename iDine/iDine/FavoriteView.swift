//
//  FavoriteView.swift
//  iDine
//
//  Created by Fábio Salata on 08/09/20.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var favorite: Favorite
    
    var body: some View {
        NavigationView {
            List {
                if favorite.items.isEmpty {
                    Text("No favorite item added yet")
                } else {
                    ForEach(favorite.items) { item in
                        ItemRow(item: item)
                    }.onDelete(perform: removeFavorite)
                }
            }.listStyle(GroupedListStyle())
            .navigationBarTitle("Favorites")
        }
    }
    
    func removeFavorite(at offsets: IndexSet) {
        favorite.items.remove(atOffsets: offsets)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView().environmentObject(Favorite())
    }
}

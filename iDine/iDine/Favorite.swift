//
//  Favorite.swift
//  iDine
//
//  Created by Fábio Salata on 08/09/20.
//

import Foundation

final class Favorite: ObservableObject {
    @Published var items = [MenuItem]()
    
    func add(item: MenuItem)  {
        items.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
    
    func isFavorite(item: MenuItem) -> Bool {
        items.contains(item)
    }
}

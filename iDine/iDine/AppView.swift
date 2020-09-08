//
//  AppView.swift
//  iDine
//
//  Created by Fábio Salata on 07/09/20.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                TabView {
                    ContentView()
                        .tabItem {
                            Image(systemName: "list.dash")
                            Text("Menu")
                        }
                    
                    OrderView()
                        .tabItem {
                            Image(systemName: "square.and.pencil")
                            Text("Order")
                        }
                }
                
//                if order.items.count > 0 {
//                    Badge(count: order.items.count, geometry: geometry)
//                }
            }
        }
    }
}

//struct Badge: View {
//    let count: Int
//    let geometry: GeometryProxy
//    
//    var body: some View {
//        Text("\(count)")
//            .font(.caption)
//            .foregroundColor(.white)
//            .background (
//                Circle()
//                    .fill(Color.red)
//                    .frame(width: 18, height: 18)
//            )
//            .offset(x: (geometry.size.width / 2) + ((geometry.size.width / 2) / 2) + 8, y: -33)
//    }
//}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environmentObject(Order())
    }
}

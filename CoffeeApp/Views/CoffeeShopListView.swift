//
//  CoffeeShopListView.swift
//  CoffeeApp
//
//  Created by Ikhwan on 19/11/22.
//

import SwiftUI

struct CoffeeShopListView: View {
    // MARK : -Properties
    @State
    private var searchText: String = ""
    
    private var coffeeSearchResults: [CoffeeShop] {
        let results = CoffeeShopProvider.all()
        
        if searchText.isEmpty {
            return results
        }
        
        return results.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    private var suggestedResults : [CoffeeShop] {
        return searchText.isEmpty ? [] : coffeeSearchResults
    }
    
    // MARK : -Body
    
    var body: some View {
        NavigationView {
            List(coffeeSearchResults) { result in
                NavigationLink (destination: {
                    CoffeeShopDetailView(coffeeShop: result)
                }) {
                    CoffeeShopItemView(coffeeShop: result)
                }

            }
            .navigationTitle("CoffeeShop")
        }
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer,
            prompt: "Search coffeeshops"
        ) {
            ForEach(suggestedResults) { result in
                Text("Looking for \(result.name)")
                    .searchCompletion(result.name)
            }
        }
    }
}

struct CoffeeShopListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopListView()
    }
}

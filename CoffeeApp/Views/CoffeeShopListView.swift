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
    
    @State
    private var coffeeData = CoffeeShopProvider.all()
    
    @State
    private var isLoading: Bool = true
    
    private var coffeeSearchResults: [CoffeeShop] {
        let results = coffeeData
        
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
        List {
            ForEach(coffeeSearchResults) { result in
                NavigationLink (destination: {
                    CoffeeShopDetailView(coffeeShop: result)
                }) {
                    CoffeeShopItemView(coffeeShop: result)
                }
            }
            .onDelete { index in
                coffeeData.remove(atOffsets: index)
            }
            .redacted(reason: isLoading ? .placeholder : [])
            .onAppear {
                fetchData()
            }
            .listRowSeparator(.hidden)
        }
        .refreshable {
            refreshData()
        }
        .listStyle(.plain)
        .navigationTitle("CoffeeShop")
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
    
    func refreshData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            coffeeData = CoffeeShopProvider.all()
        }
    }
    
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}

struct CoffeeShopListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopListView()
    }
}

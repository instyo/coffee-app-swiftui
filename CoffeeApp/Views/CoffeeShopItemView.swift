//
//  CoffeeShopItemView.swift
//  CoffeeApp
//
//  Created by Ikhwan on 19/11/22.
//

import SwiftUI
import ActivityView

struct CoffeeShopItemView: View {
    
    @State
    var coffeeShop: CoffeeShop
    
    @State
    var showingAlert: Bool = false
    
    @State
    private var item: ActivityItem?
    
    var body: some View {
        HStack {
            Image(coffeeShop.image)
                .resizable()
                .cornerRadius(16)
                .frame(width: 120, height: 120)
                .scaledToFill()
            
            VStack(
                alignment: .leading,
                spacing: 10
            ) {
                Text(coffeeShop.name)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(coffeeShop.location)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                HStack {
                    if coffeeShop.isFavorite {
                        Image(systemName: "heart.fill").foregroundColor(.yellow)
                    }
                    Text("Rating: 4/5")
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }.padding(.leading, 8)
        }
        .swipeActions(edge: .leading, allowsFullSwipe: false) {
            Button {
                coffeeShop.isFavorite.toggle()
            } label: {
                Image(systemName: coffeeShop.isFavorite ? "heart.slash" : "heart.fill")
            }
            .tint(.green)
            
            Button {
                item = getActivityItem()
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            .tint(.indigo)
        }
        .contextMenu {
            Button {
                showingAlert.toggle()
            } label: {
                Text("Pin this location")
                Image(systemName: "pin")
            }
            
            Button {
                coffeeShop.isFavorite.toggle()
            } label: {
                Text(coffeeShop.isFavorite ? "Remove from favorite" : "Mark as favorite")
                Image(systemName: coffeeShop.isFavorite ? "heart.slash" : "heart")
            }
            Button {
                item = getActivityItem()
            } label: {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .alert("Not yet available",
               isPresented: $showingAlert) {
            Button(role: .cancel) {
                showingAlert.toggle()
            } label: {
                Text("🆗 Buddy 👌🏻")
            }
        } message: {
            Text("This feature is not available yet 🙏🏻")
        }
        .activitySheet($item)
    }
    
    func getActivityItem() -> ActivityItem {
        return ActivityItem(items: "Place \(coffeeShop.name) will be shared!")
    }
}

struct CoffeeShopItemView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopItemView(coffeeShop: CoffeeShopProvider.all().first!)
    }
}

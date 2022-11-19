//
//  CoffeeShopItemView.swift
//  CoffeeApp
//
//  Created by Ikhwan on 19/11/22.
//

import SwiftUI

struct CoffeeShopItemView: View {
    
    let coffeeShop: CoffeeShop
    
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
                
                Text("Rating: 4/5")
                    .font(.body)
                    .foregroundColor(.gray)
            }.padding(.leading, 8)
        }
    }
}

struct CoffeeShopItemView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopItemView(coffeeShop: CoffeeShopProvider.all().first!)
    }
}

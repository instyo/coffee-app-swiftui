//
//  CoffeeShopDetailView.swift
//  CoffeeApp
//
//  Created by Ikhwan on 19/11/22.
//

import SwiftUI

struct CoffeeShopDetailView: View {
    
    let coffeeShop: CoffeeShop
    
    var body: some View {
        ZStack {
            Image("brewery")
                .resizable()
                .aspectRatio(1.0, contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: .infinity)
                .overlay {
                    Color.black.opacity(0.6)
                }
                .ignoresSafeArea()
            
            ZStack(alignment: .center) {
                Color.black
                    .frame(width: .infinity, height: 200)
                    .cornerRadius(15)
                    .padding()
                
                Text("\(coffeeShop.name)\n\(coffeeShop.location)")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }.padding([.horizontal], 20)
        }.ignoresSafeArea()
    }
}

struct CoffeeShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopDetailView(coffeeShop: CoffeeShopProvider.all().first!)
    }
}

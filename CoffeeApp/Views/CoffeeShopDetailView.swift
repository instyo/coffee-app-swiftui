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
            LinearGradient(
                colors: [.green, .indigo],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            VStack(alignment: .center) {
                Image(coffeeShop.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay {
                        ZStack {
                            Circle().opacity(0.4)
                            
                            VStack(alignment: .center) {
                                Image(systemName: "mappin.circle.fill")
                                    .font(.system(size: 60))
                                    .foregroundColor(.green)
                                
                                Text(coffeeShop.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                
                Text(coffeeShop.review)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack {
                    Image(systemName: "pin.circle.fill")
                        .font(.title)
                    
                    Text(coffeeShop.location)
                }
                
            }.padding()
        }.ignoresSafeArea()
    }
}

struct CoffeeShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopDetailView(coffeeShop: CoffeeShopProvider.all().first!)
    }
}

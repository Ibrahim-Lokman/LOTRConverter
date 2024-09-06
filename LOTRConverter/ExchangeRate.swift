//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Ibrahim Lokman on 6/9/24.
//

import SwiftUI

struct ExchangeRate: View {
    let leftImage: ImageResource
    let text: String
    let rightImage: ImageResource
    
    var body: some View {
        HStack{
            Image(leftImage)
                .resizable()
                .scaledToFit()
                .frame(height: 35)
            Text(text)
            Image(rightImage)
                .resizable()
                .scaledToFit()
                .frame(height: 35)
        }
    }
}

#Preview {
    ExchangeRate(leftImage: .goldpiece, text: "1 Gold Peice = 4 Gold Pennies", rightImage: .silverpiece)
}

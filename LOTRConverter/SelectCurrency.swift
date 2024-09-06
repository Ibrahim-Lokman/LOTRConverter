//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Ibrahim Lokman on 6/9/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment (\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Select the currency you are starting with:")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                {
                    ForEach(0..<5) { _ in
                        CurrencyIcon(currencyImage: .goldpiece, currencyName: "Gold Piece")
                    }
                }
                
         
                
                Text("Select the currency you would like to convert to:")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Button("Done"){
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown)
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency()
}

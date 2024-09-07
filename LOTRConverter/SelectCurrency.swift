//
//  SelectCurrency.swift
//  LOTRConverter
//
//  Created by Ibrahim Lokman on 6/9/24.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment (\.dismiss) var dismiss
//    @State var fromCurrency = Currency.silverPenny
//    @State var toCurrency: Currency = .goldPenny
    @Binding var fromCurrency: Currency
    @Binding var toCurrency: Currency
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            VStack{
                Text("Select the currency you are starting with:")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
             
                IconGrid(selectedCurrency: $fromCurrency)
                
                Text("Select the currency you would like to convert to:")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                IconGrid(selectedCurrency: $toCurrency)
                
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
    SelectCurrency(fromCurrency: .constant(.copperPenny), toCurrency: .constant(.goldPenny))
}

//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Ibrahim Lokman on 6/9/24.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State  var  showExchangeInfo = false
    @State var  showSelectedCurrency = false
    
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var leftCurrency = Currency.silverPiece
    @State var rightCurrency = Currency.goldPiece

    @FocusState var leftTyping
    @FocusState var rightTyping
    
    
    var body: some View {
        ZStack{
            //
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack{
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                HStack{
                    VStack {
                        HStack {
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 35)
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
                        }
                        .popoverTip(
                                    CurrencyTip(),
                                    arrowEdge: .bottom
                        )
                        
                        TextField("Amount", text: $leftAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .keyboardType(.decimalPad)
                            .onChange(of: leftAmount) {
                                if leftTyping == true {
                                    rightAmount = leftCurrency
                                        .convert(
                                         leftAmount,
                                            to: rightCurrency
                                        )
                                }
                              
                            }
                            .onChange(of: leftCurrency) {
                                leftAmount = rightCurrency
                                .convert(
                                    _: rightAmount,
                                    to: leftCurrency
                                )                            }
                    }
                    
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)
                    
                    VStack {
                        HStack {
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 35)
                            
                            
                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectedCurrency.toggle()
                        }
                        
                        
                        
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping)
                            .keyboardType(.decimalPad)
                            .onChange(of: rightAmount) {
                                if rightTyping == true {
                                    leftAmount = rightCurrency
                                    .convert(
                                        _: rightAmount,
                                        to: leftCurrency
                                    )
                                }
                                    
                            }
                            .onChange(of: rightCurrency) {
                                rightAmount = leftCurrency
                                    .convert(
                                     leftAmount,
                                        to: rightCurrency
                                    )
                            }

                      

                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                Spacer()
                HStack {
                    Spacer()
                    
                    Button{
                        showExchangeInfo.toggle()
                        print("showExchangeInfo value: \(showExchangeInfo)")
                        
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                }
            }
        }
        .task {
            try? Tips.configure()
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectedCurrency){
            SelectCurrency(
                fromCurrency: $leftCurrency,
                toCurrency: $rightCurrency
            )
        }

    }
}

#Preview {
    ContentView()
}

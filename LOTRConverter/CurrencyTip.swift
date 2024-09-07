//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Ibrahim Lokman on 7/9/24.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("Choose other currency")
}

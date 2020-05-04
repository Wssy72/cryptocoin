//
//  Cryptocurrency.swift
//  
//
//  Created by Sergey on 22/05/2019.
//

//struct Cryptocurrency {
//    let symbol: String
 //   let name: String
 //   let priceUsdLabel: String
 //   var favoriteState: Bool
//}

 struct Cryptocurrency: Decodable {
 let symbol: String
 let name: String
 let quote: SwiftQuote
 }

struct SwiftQuote: Decodable {
let USD: PriseInfo
}

struct PriseInfo: Decodable {
    let price: Double
}

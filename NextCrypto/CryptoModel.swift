//
//  CryptoModel.swift
//  NextCrypto
//
//  Created by Nini Kurshavishvili on 02.03.26.
//

import Foundation

struct Crypto: Identifiable {
    let id = UUID()
    let name: String
    let symbol: String
    let price: Double
    let change24h: Double
    let marketCap: Double
    let volume24h: Double
    let systemImageName: String

    var isPositiveChange: Bool { change24h >= 0 }
}

extension Crypto {
    static let sampleData: [Crypto] = [
        Crypto(name: "Bitcoin",  symbol: "BTC",  price: 67432.18, change24h:  2.43, marketCap: 1.32e12, volume24h: 28.5e9, systemImageName: "bitcoinsign.circle.fill"),
        Crypto(name: "Ethereum", symbol: "ETH",  price:  3521.64, change24h: -1.25, marketCap: 423.0e9, volume24h: 14.2e9, systemImageName: "e.circle.fill"),
        Crypto(name: "Tether",   symbol: "USDT", price:     1.00, change24h:  0.01, marketCap: 110.0e9, volume24h: 62.3e9, systemImageName: "dollarsign.circle.fill"),
        Crypto(name: "BNB",      symbol: "BNB",  price:   412.35, change24h:  0.87, marketCap:  63.0e9, volume24h:  1.5e9, systemImageName: "b.circle.fill"),
        Crypto(name: "Solana",   symbol: "SOL",  price:   178.92, change24h:  4.62, marketCap:  82.0e9, volume24h:  4.8e9, systemImageName: "s.circle.fill"),
        Crypto(name: "XRP",      symbol: "XRP",  price:     0.58, change24h: -0.75, marketCap:  31.0e9, volume24h:  1.9e9, systemImageName: "x.circle.fill"),
        Crypto(name: "USDC",     symbol: "USDC", price:     1.00, change24h:  0.00, marketCap:  27.0e9, volume24h:  5.4e9, systemImageName: "c.circle.fill"),
        Crypto(name: "Cardano",  symbol: "ADA",  price:     0.47, change24h:  1.23, marketCap:  16.0e9, volume24h:  0.6e9, systemImageName: "a.circle.fill"),
    ]
}

extension Double {
    var abbreviated: String {
        switch self {
        case 1e12...: return String(format: "$%.2fT", self / 1e12)
        case 1e9...:  return String(format: "$%.2fB", self / 1e9)
        case 1e6...:  return String(format: "$%.2fM", self / 1e6)
        default:      return self.formatted(.currency(code: "USD"))
        }
    }
}

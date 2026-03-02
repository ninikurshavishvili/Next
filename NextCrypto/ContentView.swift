//
//  ContentView.swift
//  NextCrypto
//
//  Created by Nini Kurshavishvili on 02.03.26.
//

import SwiftUI

struct ContentView: View {
    private let cryptos = Crypto.sampleData
    @State private var searchText = ""

    private var filteredCryptos: [Crypto] {
        guard !searchText.isEmpty else { return cryptos }
        return cryptos.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.symbol.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List(filteredCryptos) { crypto in
                NavigationLink(destination: CryptoDetailView(crypto: crypto)) {
                    CryptoRowView(crypto: crypto)
                }
            }
            .listStyle(.plain)
            .navigationTitle("NextCrypto")
            .searchable(text: $searchText, prompt: "Search coins")
        }
    }
}

// MARK: – Row view

struct CryptoRowView: View {
    let crypto: Crypto

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: crypto.systemImageName)
                .font(.title)
                .foregroundStyle(.orange)
                .frame(width: 44, height: 44)

            VStack(alignment: .leading, spacing: 2) {
                Text(crypto.name)
                    .font(.headline)
                Text(crypto.symbol)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 2) {
                Text(crypto.price.formatted(.currency(code: "USD")))
                    .font(.headline)
                Text(String(format: "%+.2f%%", crypto.change24h))
                    .font(.caption)
                    .foregroundStyle(crypto.isPositiveChange ? Color.green : Color.red)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}

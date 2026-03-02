//
//  CryptoDetailView.swift
//  NextCrypto
//
//  Created by Nini Kurshavishvili on 02.03.26.
//

import SwiftUI

struct CryptoDetailView: View {
    let crypto: Crypto

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {

                // MARK: – Header
                VStack(spacing: 8) {
                    Image(systemName: crypto.systemImageName)
                        .font(.system(size: 72))
                        .foregroundStyle(.orange)
                    Text(crypto.name)
                        .font(.title.bold())
                    Text(crypto.symbol)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                .padding(.top)

                // MARK: – Price
                VStack(spacing: 4) {
                    Text(crypto.price.formatted(.currency(code: "USD")))
                        .font(.system(size: 36, weight: .bold))
                    HStack(spacing: 4) {
                        Image(systemName: crypto.isPositiveChange ? "arrow.up.right" : "arrow.down.right")
                        Text(String(format: "%+.2f%%", crypto.change24h))
                    }
                    .font(.headline)
                    .foregroundStyle(crypto.isPositiveChange ? Color.green : Color.red)
                    Text("24h Change")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                // MARK: – Chart placeholder
                VStack(alignment: .leading, spacing: 8) {
                    Text("Price Chart")
                        .font(.headline)
                        .padding(.horizontal)
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .font(.system(size: 56))
                        .foregroundStyle(.orange.opacity(0.7))
                        .frame(maxWidth: .infinity)
                        .frame(height: 130)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal)
                }

                // MARK: – Market stats
                VStack(alignment: .leading, spacing: 12) {
                    Text("Market Statistics")
                        .font(.headline)
                        .padding(.horizontal)
                    LazyVGrid(
                        columns: [GridItem(.flexible()), GridItem(.flexible())],
                        spacing: 12
                    ) {
                        StatCard(title: "Market Cap",  value: crypto.marketCap.abbreviated)
                        StatCard(title: "24h Volume",  value: crypto.volume24h.abbreviated)
                        StatCard(title: "All-Time High", value: "—")
                        StatCard(title: "Circulating",  value: "—")
                    }
                    .padding(.horizontal)
                }

                Spacer(minLength: 24)
            }
        }
        .navigationTitle(crypto.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: – Supporting views

struct StatCard: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    NavigationStack {
        CryptoDetailView(crypto: Crypto.sampleData[0])
    }
}

//
//  SearchView.swift
//  CryptoTracker
//
//  Created by Ben Stacy on 7/18/24.
//

import SwiftUI

struct SearchView: View {
    let coins: [Coin] = [
        Coin(rank: 1, logo: "bitcoinlogo", name: "BTC", marketCap: "$1.1T", price: "$61,590.58", change: "-3.89%", changeColor: .red, coinName: "Bitcoin"),
    ]

    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                Text("Search")
                    .font(.title).bold()
                    .fontDesign(.monospaced)
                    .foregroundStyle(.white)
                    .padding(.leading, -186)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search coins or exchanges...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
                .background(Color.black)
                .foregroundStyle(.white)
                
                Text("Popular Coins")
                    .font(.headline).monospaced()
                    .foregroundStyle(.white)
                    .padding(.leading, -180)
                    .padding(.top, 10)

                
                // Column Headers
                HStack(spacing: 110) {
                    Text("Coin")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text("Price")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .offset(x: 55)
                    Text("24h%")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .offset(x: 17)
                }
                .fontDesign(.monospaced)
                .padding(.horizontal, 22)
                .offset(x: -8, y: 12)
                .background(Color.black)

//
                // Coin List
                List(coins.filter { searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText) }) { coin in
                    HStack {
                        Image(coin.logo)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(coin.name)
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)

                        Spacer()

                        Text(coin.price)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)

                        Text(coin.change)
                            .font(.subheadline)
                            .foregroundColor(coin.changeColor)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    }
                    .fontDesign(.monospaced)
                    .padding(.vertical, 8)
                    .listRowBackground(Color.black)
                }
                .listStyle(PlainListStyle())
                .background(Color.black)
            }
            .navigationBarHidden(true)
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

struct TabBarButton: View {
    var title: String
    var isSelected: Bool = false

    var body: some View {
        Text(title)
            .font(.headline)
            .padding(.vertical, 1)
            .padding(.horizontal, 1)
            .background(isSelected ? Color.gray : Color.clear)
            .foregroundColor(isSelected ? .black : .gray)
            .cornerRadius(16)
    }
}

struct TabIcon: View {
    var systemName: String
    var title: String
    var isSelected: Bool = false

    var body: some View {
        VStack {
            Image(systemName: systemName)
                .font(.title)
                .foregroundColor(isSelected ? .blue : .gray)
            Text(title)
                .font(.caption)
                .foregroundColor(isSelected ? .blue : .gray)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchView()
}

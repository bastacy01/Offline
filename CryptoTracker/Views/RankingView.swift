//
//  RankingView.swift
//  CryptoTracker
//
//  Created by Ben Stacy on 7/18/24.
//

import SwiftUI

struct RankingView: View {
    @State private var selectedCurrency = "Allchains"
    @State private var showMenu = false
    @State private var showConnectWalletScreen = false
    
    let currencies = ["Allchains", "Ethereum", "Bitcoin", "Solana", "Polygon"]
    
    let nfts: [NFT] = [
        NFT(rank: 1, logo: "pudgylogo", name: "PudgyPenguins", marketCap: "10.74 ETH", price: "390.53 ETH", change: "168%", changeColor: .green, collectionName: "TheIglooCompany"),
        NFT(rank: 2, logo: "bayclogo", name: "BAYC", marketCap: "9.24 ETH", price: "125.96 ETH", change: "51.47%", changeColor: .green, collectionName: "YugaLabs"),
        NFT(rank: 3, logo: "azukilogo", name: "Azuki", marketCap: "3.919 ETH", price: "93.83 ETH", change: "488%", changeColor: .green, collectionName: "TheGarden"),
        NFT(rank: 4, logo: "seedphrase", name: "CryptoPunks", marketCap: "26.31 ETH", price: "420.69 ETH", change: "205%", changeColor: .green, collectionName: "LarvaLabs"),
        NFT(rank: 5, logo: "pudgylogo", name: "NodeMonkes", marketCap: "1.2 BTC", price: "10.65 BTC", change: "25%", changeColor: .green, collectionName: "NodeMonkes"),
        NFT(rank: 6, logo: "degodslogo", name: "DeGods", marketCap: "16.20 ETH", price: "16.20 ETH", change: "5%", changeColor: .green, collectionName: "Artblocks"),
        NFT(rank: 7, logo: "pudgylogo", name: "Squiggles", marketCap: "7.52 ETH", price: "16.12 ETH", change: "3%", changeColor: .green, collectionName: "Artblocks"),
    ]
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("NFTs")
                    .font(.title).monospaced()
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.leading, -186)
                
                HStack(spacing: -5) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title3)
                            .padding(.leading, 10)
                            .padding(.top, 2)
                            .foregroundStyle(.white)
                    })

                    Spacer()
                    Button(action: {
                        showConnectWalletScreen.toggle()
                    }) {
                        ZStack {
                            Image(systemName: "person.circle.fill")
                                .foregroundStyle(.white)
                                .font(.title)
                        }
                    }

                    .padding(.horizontal, 12)
                }
                .fullScreenCover(isPresented: $showMenu) {
                    MenuView()
                }
                .fullScreenCover(isPresented: $showConnectWalletScreen) {
                    ConnectWalletView()
                }
                
                VStack {
                    RoundedRectangle(cornerRadius: 1)
                        .frame(width: 400, height: 1)
                        .foregroundStyle(.gray)
                    
                    iconBar
                    
                    RoundedRectangle(cornerRadius: 1)
                        .frame(width: 400, height: 1)
                        .foregroundStyle(.gray)
                        .offset(y: -15)
                }
                .offset(y: 10)
                
                // Currency icon bar
                ScrollView {
                    
                    HStack {
                        Text("Floor Price")
                            .fontDesign(.monospaced)
                        Spacer()
                        Text("24h Volume")
                            .fontDesign(.monospaced)
                    }
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
                    .padding(.horizontal, 15)

                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            switch selectedCurrency {
                            case "Allchains":
                                ForEach(nfts) { nft in
                                    NavigationLink(destination: NFTDetailView(nft: nft)) {
                                        NFTRowView(nft: nft)
                                    }
                                }
                            case "Solana":
                                SolanaView()
                            case "Bitcoin":
                                BitcoinView()
                            case "Ethereum":
                                EthereumView()
                            case "Polygon":
                                PolygonView()
                            default:
                                Text("Please select a currency").foregroundStyle(.white)
                            }
                        }
                        .padding(.top, 5)
                    }
                }
            }
            .background(Color.black.ignoresSafeArea(.all))
        }
    }
    
    var iconBar: some View {
        HStack {
              ForEach(currencies, id: \.self) { currency in
                  CurrencyIconView(currency: currency, isSelected: currency == selectedCurrency)
                      .onTapGesture {
                          self.selectedCurrency = currency
                      }
              }
          }
          .padding()
          .padding(.top, -6)
          .frame(width: 100, height: 50)
          .background(Color.black)
    }
}

#Preview {
    RankingView()
}

struct NFTRowView: View {
    let nft: NFT
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("\(nft.rank)")
                    .foregroundStyle(.white)
                
                HStack(spacing: 10) {
                    Image(nft.logo)
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(nft.name)
                            .font(.headline).monospaced()
                            .foregroundStyle(.white)
                        Text(nft.marketCap)
                            .font(.system(size: 14)).monospaced()
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 5) {
                    Text(nft.price)
                        .font(.system(size: 15.5)).monospaced()
                        .foregroundStyle(.white)
                    
                    Text(nft.change)
                        .font(.system(size: 14)).monospaced()
                        .foregroundColor(nft.changeColor)
                }
            }
            .padding(.horizontal)
 
        }
    }
}

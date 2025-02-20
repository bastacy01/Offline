//
//  HomeView.swift
//  CryptoTracker
//
//  Created by Ben Stacy on 7/18/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedCurrency = "Allchains"
    @State private var showMenu = false
    @State private var showConnectWalletScreen = false
    
    let currencies = ["Allchains", "Ethereum", "Bitcoin", "Solana", "Polygon"]
    
    let coins: [Coin] = [
        Coin(rank: 1, logo: "bitcoin-btc-logo", name: "BTC", marketCap: "$1.25 T", price: "$63,312.92", change: "2.26%", changeColor: .green, coinName: "Bitcoin"),
        Coin(rank: 2, logo: "ethereum-eth-logo", name: "ETH", marketCap: "$306.5 B", price: "$2,546.52", change: "4.80%", changeColor: .green, coinName: "Ethereum"),
        Coin(rank: 3, logo: "tether-usdt-logo", name: "USDT", marketCap: "$119.42 B", price: "$1.0000", change: "-0.01%", changeColor: .red, coinName: "Tether"),
        Coin(rank: 4, logo: "bnb-bnb-logo", name: "BNB", marketCap: "$83.38B", price: "$571.53", change: "3.22%", changeColor: .green, coinName: "BNB"),
        Coin(rank: 5, logo: "solana-sol-logo", name: "SOL", marketCap: "$70.61 B", price: "$150.84", change: "8.89%", changeColor: .green, coinName: "Solana"),
        Coin(rank: 6, logo: "usd-coin-usdc-logo", name: "USDC", marketCap: "$35.49 B", price: "$0.9999", change: "0.01%", changeColor: .green, coinName: "USDC"),
        Coin(rank: 7, logo: "xrp-xrp-logo", name: "XRP", marketCap: "$33.10 B", price: "$0.5899", change: "1.26%", changeColor: .green, coinName: "XRP"),
        Coin(rank: 8, logo: "toncoin-ton-logo", name: "TON", marketCap: "$16.94 B", price: "$6.734", change: "0.65%", changeColor: .green, coinName: "TON"),
        Coin(rank: 9, logo: "dogecoin-doge-logo", name: "DOGE", marketCap: "$15.55 B", price: "$0.106", change: "2.07%", changeColor: .green, coinName: "DOGE"),
        // Add more coins as needed
    ]
    
    
    var body: some View {
        NavigationStack {
            VStack {
//                Text("Welcome, User")
                Text("Market")
                    .font(.title).monospaced()
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.leading, -186)
                
                HStack(spacing: -5) {
                    Button(action: {
                        showMenu.toggle()
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .padding(.leading, 10)
                            .padding(.top, 2)
                    }
                    
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
                        HStack {
                            Text("#")
                            Image(systemName: "arrowtriangle.down.fill")
                                .font(.caption)
                            Text("Market Cap")
                                .fontDesign(.monospaced)
                        }
                        Spacer()
                        Text("Price")
                            .fontDesign(.monospaced)
                            .offset(x: 36)
                        Spacer()
                        Text("24h %")
                            .fontDesign(.monospaced)
                            
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .padding(.horizontal)
                    
                    // Content below the icon bar
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            switch selectedCurrency {
                            case "Allchains":
                                ForEach(coins) { coin in
                                    CoinRowView(coin: coin)
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
    HomeView()
}

struct CurrencyIconView: View {
    var currency: String
    var isSelected: Bool

    var body: some View {
        VStack {
            Image(iconForCurrency(currency))
//            Image("bitcoinlogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 38, height: 23)
                .scaleEffect(currency == "Ethereum" ? 1.7 : 1)
                .scaleEffect(currency == "Solana" ? 1.5 : 1)
                .scaleEffect(currency == "Allchains" ? 1.4 : 1) // change to offline ellipsis
                .scaleEffect(currency == "Bitcoin" ? 1.25 : 1)
                .scaleEffect(currency == "Polygon" ? 1.30 : 1)
                .grayscale(isSelected ? 0 : 1)
                .padding()
                .padding(.top, -15)
                .padding(.top, currency == "Solana" ? 5 : 3)
        }
    }

    func iconForCurrency(_ currency: String) -> String {
        switch currency {
        case "Bitcoin":
            return "bitcoinlogo"
        case "Ethereum":
            return "ethereumlogo4"
        case "Solana":
            return "solanalogo3"
        case "Polygon":
            return "baselogo"
        case "Allchains":
            return "ellipsisImage2"
        default:
            return "circle.fill"
        }
    }
}

struct AllchainsView: View {
    @State private var showNewImage = false
    
    let imageNames = ["nodeMonkes", "trumpCard", "okayDogs", "bitcoinPuppets", "quantumCats"]
    var body: some View {
        VStack {
            if !showNewImage {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(0..<imageNames.count, id: \.self) { index in
                            Image(imageNames[index])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 300, height: 312)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 0)
                                        .frame(width: 300, height: 342)
                                )
                        }
                    }.padding()
                }
                .transition(.slide)

                Image("allchainsTop")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: 3)
                    .onTapGesture {
                        withAnimation {
                            self.showNewImage = true
                        }
                    }
                    .transition(.slide)
            } else {
                Image("Top")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(x: 5, y: -12)
                    .transition(.slide)
            }
        }
    }
}

struct SolanaView: View {
    var body: some View {
        Text("Solana data...")
            .foregroundStyle(.white)
    }
}

struct BitcoinView: View {
    var body: some View {
        Text("Bitcoin data...")
            .foregroundStyle(.white)
    }
}

struct EthereumView: View {
    var body: some View {
        Text("Ethereum data...")
            .foregroundStyle(.white)
    }
}

struct PolygonView: View {
    var body: some View {
        Text("Base data...")
            .foregroundStyle(.white)
    }
}

struct CoinRowView: View {
    let coin: Coin
    
    var body: some View {
        NavigationLink(destination: CoinDetailView(coin: coin)) {
            VStack {
                HStack(spacing: 20) {
                    Text("\(coin.rank)")
                        .fontDesign(.monospaced)
                        .foregroundStyle(.white)
                    
                    HStack(spacing: 10) {
                        Image(coin.logo)
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(coin.name)
                                .font(.headline).monospaced()
                                .foregroundStyle(.white)
                            Text(coin.marketCap)
                                .font(.system(size: 13)).monospaced()
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Spacer()
                    
                    Text(coin.price)
                        .font(.system(size: 15.5)).monospaced()
                        .foregroundStyle(.white)
                        .offset(x: -20)
                    
                    Text(coin.change)
                        .font(.system(size: 13)).monospaced()
                        .foregroundColor(coin.changeColor)
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CoinDetailView: View {
    let coin: Coin
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            // Coin Header Section
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(coin.logo)
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(coin.coinName)
                            .font(.title).monospaced()
                            .bold()
                            .foregroundColor(.white)
                        Text(coin.name)
                            .font(.headline).monospaced()
                            .foregroundStyle(.white)
                            .padding(.top, 6)
                    }
                    
                    HStack {
                        Text("Market Cap:")
                            .font(.subheadline)
                            .fontDesign(.monospaced)
                            .foregroundColor(.gray)
                        Text("\(coin.marketCap)")
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    Text("\(coin.price)")
                        .font(.largeTitle).monospaced()
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                }
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(coin.changeColor)
                        .frame(width: 80, height: 35)
                    
                    Text("\(coin.change)")
                        .font(.subheadline).bold()
                        .fontDesign(.monospaced)
                        .foregroundColor(.white)
                }
                .padding(.top, -60)
            }
            .padding()
            
            // Time Interval Bar
            TimeIntervalBar()
            
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.1))
                
                ChartView(data: getPriceData(), lineColor: coin.changeColor)
            }
            .frame(height: 250)
            .padding()
            
            VStack(alignment: .leading, spacing: 25) {
                Text("Statistics")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                    HStack(spacing: 14) {
                        StatisticPill(title: "24 hours", value: "1.76%", isPositive: true)
                        StatisticPill(title: "7 days", value: "4.77%", isPositive: true)
                        StatisticPill(title: "30 days", value: "10.89%", isPositive: true)
                        StatisticPill(title: "90 days", value: "8.01%", isPositive: true)
                        StatisticPill(title: "YTD", value: "49.04%", isPositive: true)
                    }
                    .padding(.horizontal)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.2))
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 360, height: 55)
                    )
                
            }
            .padding(.top, -5)
            
            Spacer()
        }
        .background(Color.black.ignoresSafeArea(.all))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.backward")
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
    func getPriceData() -> [Double] {
        return [
            45000, 45500, 46000, 45800, 46300, 46800, 47000, 46900, 47100, 47400,
            48000, 48200, 47900, 47600, 47800, 47500, 47200, 47000, 46800, 46600,
            46200, 46000, 45900, 46100, 46300, 46500, 46700, 46900, 47200, 47500
        ]
    }
}

struct TimeIntervalBar: View {
    @State private var selectedInterval = "24h"
    private let intervals = ["1h", "24h", "7d", "30d", "90d", "1y", "All"]

    var body: some View {
        HStack(spacing: 9) {
            ForEach(intervals, id: \.self) { interval in
                Text(interval)
                    .font(.subheadline)
                    .foregroundColor(selectedInterval == interval ? .black : .gray)
                    .bold(selectedInterval == interval)
                    .padding(.vertical, 4)
                    .padding(.horizontal, 10)
                    .background(
                        selectedInterval == interval ? Color.white : Color.clear
                    )
                    .cornerRadius(10)
                    .onTapGesture {
                        selectedInterval = interval
                    }
            }
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.2))
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: 360, height: 38)
        )
        .padding(.horizontal)
        .padding(.top, -5)
    }
}

struct StatisticPill: View {
    let title: String
    let value: String
    let isPositive: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack(spacing: 2) {
                    Image(systemName: isPositive ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                        .font(.caption2)
                    Text(value)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
                .foregroundColor(isPositive ? .green : .red)
            }
            .cornerRadius(8)
        }
    }
}

struct LineChartPlaceholder: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.gray.opacity(0.1))
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                .frame(width: 360, height: 250)
            
            Path { path in
                path.move(to: CGPoint(x: 5, y: 150))
                path.addCurve(
                    to: CGPoint(x: 365, y: 100),
                    control1: CGPoint(x: 100, y: 200),
                    control2: CGPoint(x: 300, y: 50)
                )
            }
            .stroke(Color.green, lineWidth: 2)
            .frame(height: 250)
        }
    }
}

import SwiftUI

struct ChartView: View {
    let data: [Double]
    let lineColor: Color

    private let maxY: Double
    private let minY: Double
    private let startingDate: Date
    private let endingDate: Date
    @State private var percentage: CGFloat = 0

    init(data: [Double], lineColor: Color = .green) {
        self.data = data
        self.lineColor = lineColor
        self.maxY = data.max() ?? 0
        self.minY = data.min() ?? 0
        self.startingDate = Calendar.current.date(byAdding: .day, value: -data.count, to: Date())!
        self.endingDate = Date()
    }

    var body: some View {
        VStack {
            chartView
                .frame(height: 150)
        }
        .font(.caption)
        .foregroundColor(Color.gray)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.linear(duration: 2.0)) {
                    percentage = 1.0
                }
            }
        }
    }
}

extension ChartView {
    private var chartView: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    let xPosition = geometry.size.width / CGFloat(data.count - 1) * CGFloat(index)

                    let yAxis = maxY - minY
                    let yPosition = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height

                    if index == 0 {
                        path.move(to: CGPoint(x: 0, y: yPosition))
                    } else {
                        path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                    }
                }
            }
            .trim(from: 0, to: percentage)
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .shadow(color: lineColor, radius: 10, x: 0.0, y: 10)
        }
    }
}

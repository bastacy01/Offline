//
//  NFTDetailView.swift
//  CryptoTracker
//
//  Created by Ben Stacy on 8/1/24.
//

import SwiftUI

struct NFTDetailView: View {
    let nft: NFT
    
    @State private var offset: CGFloat = 0
    @State private var isDragging: Bool = false
    @State private var accumulatedOffset: CGFloat = 0
    @Environment(\.presentationMode) var presentationMode
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    let items = Array(0..<8)
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header Image
                ZStack {
                    Image(nft.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 110)
                        .clipped()
                        .padding(.top, -65)
                    
                    VStack {
                        Spacer()
                        Image(nft.logo)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .background(Color.black)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .offset(x: -140, y: -17)
                    }
                }
                .frame(height: 180)
                .padding(.bottom, -30)
                
                // NFT Information
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(nft.name)
                            .font(.title).monospaced()
                            .bold()
                            .foregroundStyle(.white)
                        Spacer()
                        HStack {
                            Button(action: {
            
                            }) {
                                Image(systemName: "globe")
                                    .foregroundColor(.white)
                            }
                            Button(action: {
                            
                            }) {
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    
                    HStack(spacing: 1) {
                        Text(nft.collectionName)
                            .padding(2)
                            .fontDesign(.monospaced)
                            .foregroundStyle(.white)
                        Image(systemName: "checkmark.seal.fill")
                            .padding(2)
                            .foregroundStyle(.blue)
                        Spacer()
                    }
                    .padding(.leading, -3)
                    .offset(y: -4)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Items")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Text("10,000")
                                .font(.subheadline).bold()
                                .foregroundStyle(.white)
                        }
                        .monospaced()
                        Spacer()
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Total Owners")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Text("5,381")
                                .font(.subheadline).bold()
                                .foregroundStyle(.white)
                        }
                        .monospaced()
                        .padding(.leading, 40)
                        Spacer()
                        VStack(alignment: .leading, spacing: 5) {
                            Text("24h Sales")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Text("63")
                                .font(.subheadline).bold()
                                .foregroundStyle(.white)
                        }
                        .monospaced()
                        .offset(x: -8)
                    }
                    .foregroundStyle(.white)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Floor Price")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Text("9.670 ETH")
                                .font(.subheadline).bold()
                                .foregroundStyle(.white)
                        }
                        .monospaced()
                        Spacer()
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Avg Price")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Text("9.622 ETH")
                                .font(.subheadline).bold()
                                .foregroundStyle(.white)
                        }
                        .monospaced()
                        .padding(.leading, -22)
                        Spacer()
                        VStack(alignment: .leading, spacing: 5) {
                            Text("24h Volume")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            Text("606.21 ETH")
                                .font(.subheadline).bold()
                                .foregroundStyle(.white)
                        }
                        .monospaced()
                    }
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                    
                    // About Section
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("About \(nft.name)")
                                .font(.system(size: 16)).monospaced()
                                .foregroundStyle(.white)
                            Spacer()
                            Button(action: {
       
                            }) {
                                Text("See all")
                                    .font(.system(size: 13)).monospaced()
                                    .foregroundColor(.blue)
                            }
                        }
                        
                        Text("The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs—unique digital collectibles living on the Ethereum blockchain. Your Bored Ape...")
                            .font(.system(size: 12)).monospaced()
                            .foregroundStyle(.white)
                    }
                    .padding(.top, 20)
                }
                .padding()
                
                // Grid View
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Items")
                            .font(.headline).monospaced()
                            .foregroundStyle(.white)
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Image(systemName: "line.horizontal.3.decrease.circle")
                                .foregroundStyle(.white)
                        }
                        Button(action: {
                            
                        }) {
                            Image(systemName: "arrow.up.arrow.down.circle")
                                .foregroundStyle(.white)
                        }
                        Button(action: {
                                
                        }) {
                            Image(systemName: "square.grid.2x2")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal)
                    
                    LazyVGrid(columns: columns, spacing: 16) {
                         ForEach(0..<8) { index in
                             VStack {
                                 Image("nft")
                                     .resizable()
                                     .aspectRatio(contentMode: .fill)
                                     .frame(width: 150, height: 150)
                                     .background(Color.gray.opacity(0.3))
                                     .cornerRadius(8)
                                 
                                 VStack(alignment: .leading, spacing: 4) {
                                     Text("BAYC #\(index)")
                                         .font(.subheadline)
                                         .foregroundColor(.white)
                                     Text("9.20 ETH")
                                         .font(.subheadline)
                                         .foregroundStyle(.white)
                                     Text("Last sale: 1.5 ETH")
                                         .font(.caption)
                                         .foregroundStyle(.gray)
                                     
                                 }
                                 .padding(.trailing, 55)
                                 .padding(.horizontal, 8)
                                 .padding(.vertical, 4)
                                 .background(Color.black)
                                 .cornerRadius(8)
                                 .fontDesign(.monospaced)
                             }
                             .background(Color.black.opacity(0.8))
                         }
                     }
                     .padding(.horizontal)
                 }
                 .padding(.bottom, 20)
                 .background(Color.black)
            }
        }
        .background(Color.black.ignoresSafeArea(.all))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

func rotationAngle(for index: Int, in geometry: GeometryProxy, offset: CGFloat) -> Double {
    let cardHeight: CGFloat = 200
    let midPoint = geometry.size.height / 2
    let cardOffset = CGFloat(index) * cardHeight
    let distanceFromCenter = cardOffset - midPoint + offset
    let percentageFromCenter = distanceFromCenter / midPoint
    return Double(percentageFromCenter) * 45.0
}

func opacity(for index: Int, in geometry: GeometryProxy, offset: CGFloat) -> Double {
    let cardHeight: CGFloat = 150
    let midPoint = geometry.size.height / 2
    let cardOffset = CGFloat(index) * cardHeight
    let distanceFromCenter = abs(cardOffset - midPoint + offset)
    let maxDistance = midPoint + cardHeight
    return Double(1 - (distanceFromCenter / maxDistance)) * 1.5
}

#Preview {
    RankingView()
}

struct CardView: View {
    let index: Int
    
    var body: some View {
        HStack {
            Image("nft")
                .resizable()
                .frame(width: 200, height: 180)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("BAYC #\(index)")
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text("9.20 ETH")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                Text("Last sale: 1.5 ETH")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            .offset(x: -25)
            .padding(.vertical, 4)
            .background(Color.black.opacity(0.5))
        }
    }
}

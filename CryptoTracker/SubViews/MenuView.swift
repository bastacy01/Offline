//
//  MenuView.swift
//  CryptoTracker
//
//  Created by Ben Stacy on 7/18/24.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack {
                HStack(spacing: 210) {
                    HStack(spacing: 1) {
                        HStack(spacing: 5) {
                            Image(systemName: "ellipsis.circle")
                                .foregroundStyle(.white)
                                .font(.system(size: 22))
                            
                            Text("OFF")
                                .font(.title3).bold()
                                .fontDesign(.monospaced)
                                .foregroundStyle(.white)
                        }
                        Text("line")
                            .font(.system(size: 14)).monospaced()
                            .fontWeight(.medium)
                            .foregroundStyle(.white)
                            .underline(true, color: .white)
                            .padding()
                            .padding(.leading, -16)
                            .padding(.top, 1)
                        
                    }
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.title3)
    
                            .foregroundStyle(.white)
                    }
                    .padding()
                }
                VStack(spacing: 30) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Discover")
                            .font(.title3).bold()
                            .fontDesign(.monospaced)
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Top Movers")
                            
                            Text("Memecoins")
                            
                            Text("Crypto News")
                        }
                        .font(.system(size: 15)).monospaced()
                        .padding(.leading, 15)
                    }
                    .foregroundStyle(.white)
                    .padding(.trailing, 255)
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("NFT")
                            .font(.title3).bold()
                            .fontDesign(.monospaced)
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Trending Mints")
                            Text("Open Editions")
                            Text("Top Collections")
                            
                        }
                        .font(.system(size: 15)).monospaced()
                        .padding(.leading, 15)
                    }
                    .foregroundStyle(.white)
                    .padding(.trailing, 211)
                }
                RoundedRectangle(cornerRadius: 1)
                    .frame(width: 450, height: 0.5)
                    .foregroundStyle(.white)
                    .padding(.top, 15)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Company")
                        .font(.title3).bold()
                        .fontDesign(.monospaced)
                    VStack(alignment: .leading, spacing: 20) {
                        Text("About")
                        Text("Contact")
                    }
                    .font(.system(size: 15)).monospaced()
                    .padding(.leading, 15)
                }
                .foregroundStyle(.white)
                .padding(.trailing, 280)
                .padding(.top, 20)

                Spacer()
            }
        }
    }
}

#Preview {
    MenuView()
}

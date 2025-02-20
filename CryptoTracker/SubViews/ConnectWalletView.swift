//
//  ConnectWalletView.swift
//  CryptoTracker
//
//  Created by Ben Stacy on 7/18/24.
//

import SwiftUI

struct ConnectWalletView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack {
                HStack(spacing: 212) {
                        Text("Profile")
                            .font(.system(size: 25)).bold()
                            .fontDesign(.monospaced)
                            .foregroundStyle(.white)
                            .padding(.leading, 3)
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .offset(x: 8)
                    }
                    .padding()
                }
                VStack {
                    Text("Choose how you want to connect. Sign up or Log in to get started!")
                        .font(.system(size: 12)).monospaced()
                        .foregroundStyle(.white)
                        .frame(width: 365)
                        .padding(.leading, 1)
                        .padding(.horizontal, 12)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 350, height: 110)
                        .overlay(
                            VStack(alignment: .leading, spacing: 7) {
                                Text("Connect a wallet")
                                    .foregroundStyle(.white)
                                    .font(.title2).bold()
                                    .fontDesign(.monospaced)
                                Text("Enter your wallet adress (no signature!")
                                    .foregroundStyle(.gray)
                                    .font(.caption).monospaced()
                            }
                                .offset(x: -10)
                        )
                        .padding(.top, 10)
                    
                    Spacer()
                }
            }
        }
        .presentationBackground(.thinMaterial)
    }
}

#Preview {
    ConnectWalletView()
}

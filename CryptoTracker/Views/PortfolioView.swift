//
//  PortfolioView.swift
//  CryptoTracker
//
//  Created by Ben Stacy on 7/24/24.
//

import SwiftUI

struct PortfolioView: View {
    var body: some View {
        VStack {
            Text("Portfolio")
                .font(.title).bold()
                .fontDesign(.monospaced)
                .foregroundStyle(.white)
                .padding(.leading, -186)
                
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
        
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: 350, height: 110)
                .overlay(
                    VStack(alignment: .leading, spacing: 7) {
                        Text("Add transactions manually")
                            .foregroundStyle(.white)
                            .font(.title3).bold()
                            .fontDesign(.monospaced)
                        Text("Enter all transaction details to track your portfolio")
                            .foregroundStyle(.gray)
                            .font(.caption).monospaced()
                    }
                )
                .padding(.top, 10)
            Spacer()
        }
        .padding(.top, 60)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black).ignoresSafeArea(.all)
    }
}

#Preview {
    PortfolioView()
}

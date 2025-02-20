//
//  Coin.swift
//  CryptoTracker
//
//  Created by Ben Stacy on 7/24/24.
//

import Foundation
import SwiftUI

struct Coin: Identifiable {
    let id = UUID()
    let rank: Int
    let logo: String
    let name: String
    let marketCap: String
    let price: String
    let change: String
    let changeColor: Color
    let coinName: String 
}

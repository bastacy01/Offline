//
//  MainTabView.swift
//  CryptoTracker
//
//  Created by Ben Stacy on 7/18/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    @State private var showCreatePostView = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "chart.line.uptrend.xyaxis" : "chart.line.uptrend.xyaxis")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill: .none)
                    Text("Market")
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
                .toolbarBackground(Color.black, for: .tabBar)
            
            RankingView()
                .tabItem {
                    Image(systemName: selectedTab == 1 ?
                          "photo.artframe" : "photo.artframe")
                    .environment(\.symbolVariants, selectedTab == 1 ? .fill: .none)
                    Text("NFTs")
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
                .toolbarBackground(Color.black, for: .tabBar)
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .onAppear { selectedTab =  2 }
                .tag(2)
                .toolbarBackground(Color.black, for: .tabBar)
            
            PortfolioView()
                .tabItem {
                    Image(systemName: "chart.pie")
                    Text("Portfolio")
                }
                .toolbarBackground(Color.black, for: .tabBar)
            
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ?
                          "person.2" : "person.2")
                    .environment(\.symbolVariants, selectedTab == 3 ? .fill: .none)
                    Text("Groups")
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
                .toolbarBackground(Color.black, for: .tabBar)
        }
        .tint(.white)
    }
}

#Preview {
    MainTabView()
}

//
//  ProfileView.swift
//  CryptoTracker
//
//  Created by Ben Stacy on 7/18/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Groups")
                .font(.title).bold()
                .fontDesign(.monospaced)
                .foregroundStyle(.white)
                .padding(.leading, -186)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black).ignoresSafeArea(.all)
    }
}

#Preview {
    ProfileView()
}

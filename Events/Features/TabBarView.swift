//
//  TabBarView.swift
//  Events
//
//  Created by Marcelo Diefenbach on 25/04/23.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    
//    @StateObject var viewModel = LoginAndAccountViewModel()
    @State private var firstTab = 1
    
    var body: some View {
        TabView(selection: $firstTab) {
            HomeView()
                .tabItem {
                    Label("Home",
                          systemImage: "house")
                }
                .tag(1)
        }
    }
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

//
//  MainTabView.swift
//  GroceriesSwiftUI
//
//  Created by Saurabh Jaiswal on 15/01/25.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var homeViewModel = HomeViewModel.shared
    
    var body: some View {
        VStack {
            TabView(selection: $homeViewModel.selectedTab) {
                HomeView().tag(0)
                ExploreView().tag(1)
                ExploreView().tag(2)
                ExploreView().tag(3)
                ExploreView().tag(4)
            }
//            .onAppear {
//                UIScrollView.appearance().isScrollEnabled = false
//            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onChange(of: homeViewModel.selectedTab) { newValue in
                debugPrint("Selected Tab: \(newValue)")
            }
            HStack {
                TabButton(title: "Shop", icon: "store_tab", isSelected: homeViewModel.selectedTab == 0) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeViewModel.selectedTab = 0
                        }
                    }
                }
                TabButton(title: "Explore", icon: "explore_tab", isSelected: homeViewModel.selectedTab == 1) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeViewModel.selectedTab = 1
                        }
                    }
                }
                TabButton(title: "Cart", icon: "cart_tab", isSelected: homeViewModel.selectedTab == 2) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeViewModel.selectedTab = 2
                        }
                    }
                }
                TabButton(title: "Favorites", icon: "fav_tab", isSelected: homeViewModel.selectedTab == 3) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeViewModel.selectedTab = 3
                        }
                    }
                }
                TabButton(title: "Account", icon: "account_tab", isSelected: homeViewModel.selectedTab == 4) {
                    DispatchQueue.main.async {
                        withAnimation {
                            homeViewModel.selectedTab = 4
                        }
                    }
                }
            }
            .padding(.top, 10)
            .padding(.bottom, .bottomInsets)
            .padding(.horizontal, 10)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    MainTabView()
}

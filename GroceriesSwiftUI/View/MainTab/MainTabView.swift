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
            ZStack{
                if(homeViewModel.selectedTab == 0) {
                    HomeView()
                }else if(homeViewModel.selectedTab == 1) {
                    ExploreView()
                }else if(homeViewModel.selectedTab == 2) {
                    MyCartView()
                }else if(homeViewModel.selectedTab == 3) {
                    FavouriteView()
                }else if(homeViewModel.selectedTab == 4) {
                    ExploreView()
                }
                
                VStack{
                    Spacer()
                    HStack{
                        TabButton(title: "Shop", icon: "store_tab", isSelected: homeViewModel.selectedTab == 0) {
                            print("Button Tab")
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
                        TabButton(title: "Favourite", icon: "fav_tab", isSelected: homeViewModel.selectedTab == 3) {
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
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .ignoresSafeArea()
        }
}

#Preview {
    NavigationView {
        MainTabView()
    }
}

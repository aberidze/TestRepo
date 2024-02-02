//
//  TabBarController.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 02.02.24.
//

import UIKit
import SwiftUI

final class TabBarController: UITabBarController {
        
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
        UITabBar.appearance().tintColor = .backgroundGold
        UITabBar.appearance().unselectedItemTintColor = .accentDarkGray
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .backgroundGray
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        UITabBar.appearance().standardAppearance = tabBarAppearance
    }
    
    
    // MARK: - Private Methods
    private func setupTabBar() {
        let homeVC = createNav(with: "მთავარი", and: UIImage(systemName: "house.fill"), vc: HomeViewController())
        let playVC = createNav(with: "თამაში", and: UIImage(systemName: "play.fill"), vc: PlayViewController())
        let ratingsVC = createNav(with: "რეიტინგი", and: UIImage(systemName: "trophy.fill"), vc: RatingsViewController())
        
        self.setViewControllers([homeVC, playVC, ratingsVC], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.navigationBar.tintColor = .white
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .backgroundGray
        nav.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        nav.navigationBar.standardAppearance = navigationBarAppearance
        nav.navigationBar.compactAppearance = navigationBarAppearance
        
        return nav
    }
}


// MARK: - UIViewControllerRepresentable
struct tabBarControllerRepresentable: UIViewControllerRepresentable {

    typealias UIViewControllerType = TabBarController

    func makeUIViewController(context: Context) -> TabBarController {
        return TabBarController()
    }
    
    func updateUIViewController(_ uiViewController: TabBarController, context: Context) {
        //
    }
}

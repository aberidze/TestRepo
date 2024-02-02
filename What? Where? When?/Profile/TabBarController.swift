//
//  TabBarController.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 02.02.24.
//

import UIKit
import SwiftUI

struct TabBarController: UIViewControllerRepresentable {

    typealias UIViewControllerType = HomeViewController

    func makeUIViewController(context: Context) -> HomeViewController {
        return HomeViewController()
    }
    
    func updateUIViewController(_ uiViewController: HomeViewController, context: Context) {
    }
}

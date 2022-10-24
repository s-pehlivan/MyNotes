//
//  ViewExtensions.swift
//  MyNotes
//
//  Created by Sora on 23.10.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func changeNavBarAppearance() {
        let apperance = UINavigationBarAppearance()
        apperance.configureWithTransparentBackground()
        apperance.backgroundColor = UIColor(named: "BackgroundColor")
        apperance.titleTextAttributes = [.foregroundColor: UIColor(named: "TitleTint") ?? .black]
        navigationItem.standardAppearance = apperance
        navigationItem.scrollEdgeAppearance = apperance
    }
}

extension UIButton {
        
    func roundButton(_ button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = button.bounds.height / 2
    }
}

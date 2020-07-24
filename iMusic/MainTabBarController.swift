//
//  MainTabBarController.swift
//  iMusic
//
//  Created by Boris Goncharov on 7/15/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit
import SwiftUI

protocol MainTabBarControllerDelegate: class {
    func minimizeTrackDetailController()
    func maximizeTrackDetailController(viewModel: SearchViewModel.Cell?)
}

class MainTabBarController: UITabBarController {
    
    private var minimizedTopAnchorConstraint: NSLayoutConstraint!
    private var maximizedTopAnchorConstraint: NSLayoutConstraint!
    private var bottomTopAnchorConstraint: NSLayoutConstraint!
    
    let searchVC: SearchViewController = SearchViewController.loadFromStoryboard()
    let trackDetailView: TrackDetailView = TrackDetailView.loadFromNid()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        searchVC.tabBardelegate = self
        
        let library = Library()
        let hostVC = UIHostingController(rootView: library)
        hostVC.tabBarItem.image = #imageLiteral(resourceName: "library")
        hostVC.tabBarItem.title = "Library"
        
        tabBar.tintColor = #colorLiteral(red: 1, green: 0, blue: 0.3764705882, alpha: 1)
        
        setupTrackDetailView()
        
        viewControllers = [
            hostVC, 
            generateViewController(rootViewController: searchVC, image: "magnifyingglass", title: "Search")
        ]
    }
    
    private func generateViewController(rootViewController: UIViewController, image: String, title: String) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        
        navigationVC.tabBarItem.image = UIImage(systemName: image)
        navigationVC.tabBarItem.title = title
        rootViewController.navigationItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        
        return navigationVC
    }
    
    private func setupTrackDetailView() {
        
        trackDetailView.backgroundColor = .white
        trackDetailView.tabBarDelegate = self
        trackDetailView.delegate = searchVC
        
        view.insertSubview(trackDetailView, belowSubview: tabBar)
        
        trackDetailView.translatesAutoresizingMaskIntoConstraints = false
        
        maximizedTopAnchorConstraint = trackDetailView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height)
        minimizedTopAnchorConstraint = trackDetailView.topAnchor.constraint(equalTo: tabBar.topAnchor, constant: -64)
        bottomTopAnchorConstraint = trackDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.height)
        bottomTopAnchorConstraint.isActive = true
        
        maximizedTopAnchorConstraint.isActive = true

        trackDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        trackDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
}

extension MainTabBarController: MainTabBarControllerDelegate {
    func maximizeTrackDetailController(viewModel: SearchViewModel.Cell?) {
        
        minimizedTopAnchorConstraint.isActive = false
        maximizedTopAnchorConstraint.isActive = true
        maximizedTopAnchorConstraint.constant = 0
        bottomTopAnchorConstraint.constant = 0
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        self.view.layoutIfNeeded()
                        self.tabBar.alpha = 0
                        self.trackDetailView.miniTrackView.alpha = 0
                        self.trackDetailView.maximizedStackView.alpha = 1
                        
        },
                       completion: nil)
        
        guard let viewModel = viewModel else { return }
        self.trackDetailView.set(viewModel: viewModel)
    }
    
    func minimizeTrackDetailController() {
        
        maximizedTopAnchorConstraint.isActive = false
        bottomTopAnchorConstraint.constant = view.frame.height
        minimizedTopAnchorConstraint.isActive = true
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.7,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: {
                        self.view.layoutIfNeeded()
                        self.tabBar.alpha = 1
                        self.trackDetailView.miniTrackView.alpha = 1
                        self.trackDetailView.maximizedStackView.alpha = 0
        },
                       completion: nil)
    }
}

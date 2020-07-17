//
//  UIViewController + Stroryboard.swift
//  iMusic
//
//  Created by Boris Goncharov on 7/17/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit

extension UIViewController {
    
    class func loadFromStoryboard<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? T {
            return viewController
        } else {
            fatalError("Error: No initial view controller in \(name) satoryboard.")
        }
    }
}

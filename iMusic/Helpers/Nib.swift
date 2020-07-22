//
//  Nib.swift
//  iMusic
//
//  Created by Boris Goncharov on 7/22/20.
//  Copyright © 2020 Boris Goncharov. All rights reserved.
//

import UIKit

extension UIView {
    class func loadFromNid<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

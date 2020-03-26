//
//  UIViewController+Extensions.swift
//  FiltersInterfacePoc
//
//  Created by Gabriel Pereira on 26/03/20.
//  Copyright © 2020 Gabriel Pereira. All rights reserved.
//

import UIKit

extension UIViewController {
    func addChildSubview(_ child: UIViewController) {
        // First, add the view of the child to the view of the parent
        addChild(child)
        
        // Then, add the child to the parent
        view.addSubview(child.view)
        
        // Finally, notify the child that it was moved to a parent
        child.didMove(toParent: self)
    }
}

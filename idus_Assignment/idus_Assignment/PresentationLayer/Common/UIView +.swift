//
//  UIView +.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/17.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}

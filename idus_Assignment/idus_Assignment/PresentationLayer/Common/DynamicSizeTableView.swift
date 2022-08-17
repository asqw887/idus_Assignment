//
//  UITableView +.swift
//  idus_Assignment
//
//  Created by 최예주 on 2022/08/17.
//

import Foundation
import UIKit

class DynamicSizeTableView: UITableView {
    
    override var intrinsicContentSize: CGSize {
      let height = self.contentSize.height + self.contentInset.top + self.contentInset.bottom
      return CGSize(width: self.contentSize.width, height: height)
    }
    
    override func layoutSubviews() {
      self.invalidateIntrinsicContentSize()
      super.layoutSubviews()
    }
}


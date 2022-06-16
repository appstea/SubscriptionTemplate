//
//  CGSize~Extensions.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/16/22.
//

import UIKit

extension CGSize {

//  init(side: Int) { self.init(width: side, height: side) }
//  init(side: CGFloat) { self.init(width: side, height: side) }
//  init(side: Double) { self.init(width: side, height: side) }

//  var rectValue: CGRect { return CGRect(origin: .zero, size: self) }
//  var integral: CGSize { return CGRect(size: self).integral.size }
//  var standartized: CGSize { return CGRect(size: self).standardized.size }
//  var isEmpty: Bool { return CGRect(size: self).isEmpty }
//  var isNull: Bool { return CGRect(size: self).isNull }
//  var isInfinite: Bool { return CGRect(size: self).isInfinite }
//  var minSide: CGFloat { return Swift.min(width, height) }
//  var maxSide: CGFloat { return Swift.max(width, height) }

  var aspectRatio: CGFloat { return height != 0 ? width / height : 0.0 }

}

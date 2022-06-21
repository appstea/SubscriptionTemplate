//
//  CGSize~Extensions.swift
//  SubsTemplate
//
//  Created by dDomovoj on 6/16/22.
//

import UIKit

extension CGSize {

  var aspectRatio: CGFloat { return height != 0 ? width / height : 0.0 }

}

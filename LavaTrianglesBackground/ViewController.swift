//
//  ViewController.swift
//  LavaTrianglesBackground
//
//  Created by Kristaps Grinbergs on 12/05/2018.
//  Copyright © 2018 fassko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let alphaLevels = [
      0.0,
      0.15,
      0.2,
      0.3,
      0.4,
      ].map { CGFloat($0) }
    
    let backgroundAnimationView = BackgroundView(
      frame: view.bounds,
      fillColor: .red,
      backgroundColor: .green,
      alphaLevels: alphaLevels)
    
    view.addSubview(backgroundAnimationView)
  }

}


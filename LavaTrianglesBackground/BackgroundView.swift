//
//  BackgroundView.swift
//
//  Created by Kristaps Grinbergs on 03/08/2017.
//  Copyright © 2017 Qminder. All rights reserved.
//

import UIKit
import QuartzCore

/// Animatable beziers element
typealias AnimatableElement = (points1: [CGPoint], points2: [CGPoint], points3: [CGPoint], layer: CAShapeLayer)

// Animatable layer with animations
typealias AnimateLayer = (layer: CAShapeLayer, animGroup: CAAnimationGroup)

class BackgroundView: UIView {
  
  /// Triangle fill color
  private var fillColor: UIColor?
  
  /// Gradient from
  private var gradientFrom: UIColor?
  
  /// Gradient to
  private var gradientTo: UIColor?
  
  /// Alpha levels
  private var alphaLevels: [CGFloat]?
  
  /// Array of beziers to create animations
  private var animateBeziers: [AnimatableElement] = []
  
  /// Array of layers to animate
  private var animateLayers: [AnimateLayer] = []
  
  init(frame: CGRect,
       fillColor: UIColor,
       backgroundColor: UIColor,
       alphaLevels: [CGFloat]) {
    super.init(frame: frame)

    self.fillColor = fillColor
    self.alphaLevels = alphaLevels
    
    self.backgroundColor = backgroundColor
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func draw(_ rect: CGRect) {
    
    guard let alphaLevels = self.alphaLevels, let color = self.fillColor else {
      return
    }
    
    let animationTime = 1.0
    
    // Spiral points
    let numberOfPoints = 500
    
    // On Screen
    let spiralPoints1 = createPointsOnSpiral(arc: 20.0, separation: 0.8, numPoints: numberOfPoints, center: CGPoint(x: 165, y: 600))
    let spiralPoints2 = createPointsOnSpiral(arc: 7.0, separation: 0.4, numPoints: numberOfPoints, center: CGPoint(x: 316, y: 1051), rotationDegrees: 90.0, invert: true)
    let spiralPoints3 = createPointsOnSpiral(arc: 8.0, separation: 0.6, numPoints: numberOfPoints, center: CGPoint(x: 510, y: 943), rotationDegrees: 45.0)
    let spiralPoints4 = createPointsOnSpiral(arc: 17.0, separation: 0.5, numPoints: numberOfPoints, center: CGPoint(x: 1252, y: 745), rotationDegrees: 180.0, invert: true)
    let spiralPoints5 = createPointsOnSpiral(arc: 15.0, separation: 0.5, numPoints: numberOfPoints, center: CGPoint(x: 622, y: 572), rotationDegrees: 45.0, invert: true)
    let spiralPoints6 = createPointsOnSpiral(arc: 7.0, separation: 0.3, numPoints: numberOfPoints, center: CGPoint(x: 1014, y: 383), rotationDegrees: 30.0, invert: true)
    let spiralPoints7 = createPointsOnSpiral(arc: 6.0, separation: 0.4, numPoints: numberOfPoints, center: CGPoint(x: 1585, y: 214), rotationDegrees: 270.0)
    let spiralPoints8 = createPointsOnSpiral(arc: 8.0, separation: 0.5, numPoints: numberOfPoints, center: CGPoint(x: 1488, y: 381), rotationDegrees: 200.0, invert: true)
    
    // Outside screen
    let spiralPoints9 = createPointsOnSpiral(arc: 15.0, separation: 0.5, numPoints: numberOfPoints, center: CGPoint(x: -30, y: -130), rotationDegrees: 15.0, invert: true)
    let spiralPoints10 = createPointsOnSpiral(arc: 18.0, separation: 1.0, numPoints: numberOfPoints, center: CGPoint(x: 387, y: -96), rotationDegrees: 75.0)
    let spiralpoints11 = createPointsOnSpiral(arc: 30.0, separation: 1.5, numPoints: numberOfPoints, center: CGPoint(x: -140, y: 250), rotationDegrees: 230.0, invert: true)
    let spiralPoints12 = createPointsOnSpiral(arc: 45.0, separation: 2, numPoints: numberOfPoints, center: CGPoint(x: -462, y: 850), rotationDegrees: 200.0, invert: true)
    let spiralPoints13 = createPointsOnSpiral(arc: 25.0, separation: 1.3, numPoints: numberOfPoints, center: CGPoint(x: -205, y: 1200), rotationDegrees: 60.0)
    let spiralPoints14 = createPointsOnSpiral(arc: 18.0, separation: 1.3, numPoints: numberOfPoints, center: CGPoint(x: 140, y: 1290), rotationDegrees: 60.0, invert: true)
    let spiralPoints15 = createPointsOnSpiral(arc: 19.0, separation: 0.9, numPoints: numberOfPoints, center: CGPoint(x: 445, y: 1145), rotationDegrees: 88.0)
    let spiralPoints16 = createPointsOnSpiral(arc: 25.0, separation: 3.3, numPoints: numberOfPoints, center: CGPoint(x: 785, y: 1285), rotationDegrees: 7.0, invert: true)
    let spiralPoints17 = createPointsOnSpiral(arc: 15.0, separation: 1.5, numPoints: numberOfPoints, center: CGPoint(x: 910, y: -170), rotationDegrees: 300.0)
    let spiralPoints18 = createPointsOnSpiral(arc: 25.0, separation: 3.3, numPoints: numberOfPoints, center: CGPoint(x: 1233, y: -114), rotationDegrees: 250.0, invert: true)
    let spiralPoints19 = createPointsOnSpiral(arc: 10.0, separation: 2.0, numPoints: numberOfPoints, center: CGPoint(x: 1330, y: 1166), rotationDegrees: 111.0)
    let spiralPoints20 = createPointsOnSpiral(arc: 13.0, separation: 1.3, numPoints: numberOfPoints, center: CGPoint(x: 1713, y: -298), rotationDegrees: 130.0, invert: true)
    let spiralPoints21 = createPointsOnSpiral(arc: 18.0, separation: 1.8, numPoints: numberOfPoints, center: CGPoint(x: 2064, y: 99), rotationDegrees: 130.0)
    let spiralPoints22 = createPointsOnSpiral(arc: 29.0, separation: 3.0, numPoints: numberOfPoints, center: CGPoint(x: 2050, y: 615), rotationDegrees: 250.0, invert: true)
    let spiralPoints23 = createPointsOnSpiral(arc: 12.0, separation: 4.0, numPoints: numberOfPoints, center: CGPoint(x: 2010, y: 977), rotationDegrees: 245.0, invert: true)
    let spiralPoints24 = createPointsOnSpiral(arc: 15.0, separation: 10.0, numPoints: numberOfPoints, center: CGPoint(x: 2010, y: 1222), rotationDegrees: 13.0)
    
    // Triangle 1
    drawTriangle(points1: spiralPoints9, points2: spiralPoints10, points3: spiralpoints11, fillColor: color.withAlphaComponent(alphaLevels[4]))
    
    // Triangle 2
    drawTriangle(points1: spiralPoints1, points2: spiralpoints11, points3: spiralPoints12, fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    // Triangle 3
    drawTriangle(points1: spiralPoints1, points2: spiralPoints10, points3: spiralpoints11, fillColor: color.withAlphaComponent(alphaLevels[1]))
    
    // Triangle 4
    drawTriangle(points1: spiralPoints1, points2: spiralPoints2, points3: spiralPoints12, fillColor: color.withAlphaComponent(alphaLevels[2]))
    
    // Triangle 5
    drawTriangle(points1: spiralPoints1, points2: spiralPoints5, points3: spiralPoints10, fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    // Triangle 6
    drawTriangle(points1: spiralPoints1, points2: spiralPoints5, points3: spiralPoints3, fillColor: color.withAlphaComponent(alphaLevels[4]))
    
    // Triangle 7
    drawTriangle(points1: spiralPoints1, points2: spiralPoints3, points3: spiralPoints2, fillColor: color.withAlphaComponent(alphaLevels[1]))
    
    // Triangle 8
    drawTriangle(points1: spiralPoints2, points2: spiralPoints12, points3: spiralPoints13, fillColor: color.withAlphaComponent(alphaLevels[0]))
    
    // Triangle 9
    drawTriangle(points1: spiralPoints2, points2: spiralPoints13, points3: spiralPoints14, fillColor: color.withAlphaComponent(alphaLevels[4]))
    
    // Triangle 10
    drawTriangle(points1: spiralPoints2, points2: spiralPoints14, points3: spiralPoints15, fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    // Triangle 11
    drawTriangle(points1: spiralPoints2, points2: spiralPoints3, points3: spiralPoints15, fillColor: color.withAlphaComponent(alphaLevels[4]))
    
    // Triangle 12
    drawTriangle(points1: spiralPoints3, points2: spiralPoints15, points3: spiralPoints16, fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    // Triangle 13
    drawTriangle(points1: spiralPoints3, points2: spiralPoints4, points3: spiralPoints16, fillColor: color.withAlphaComponent(alphaLevels[1]))
    
    // Triangle 14
    drawTriangle(points1: spiralPoints3, points2: spiralPoints4, points3: spiralPoints5, fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    // Triangle 15
    drawTriangle(points1: spiralPoints5, points2: spiralPoints10, points3: spiralPoints17, fillColor: color.withAlphaComponent(alphaLevels[2]))
    
    // Triangle 16
    drawTriangle(points1: spiralPoints5, points2: spiralPoints6, points3: spiralPoints17, fillColor: color.withAlphaComponent(alphaLevels[4]))
    
    // Triangle 17
    drawTriangle(points1: spiralPoints6, points2: spiralPoints17, points3: spiralPoints18, fillColor: color.withAlphaComponent(alphaLevels[1]))
    
    // Triangle 18
    drawTriangle(points1: spiralPoints4, points2: spiralPoints5, points3: spiralPoints6, fillColor: color.withAlphaComponent(alphaLevels[1]))
    
    // Triangle 19
    drawTriangle(points1: spiralPoints4, points2: spiralPoints16, points3: spiralPoints19, fillColor: color.withAlphaComponent(alphaLevels[0]))
    
    // Triangle 20
    drawTriangle(points1: spiralPoints4, points2: spiralPoints8, points3: spiralPoints19, fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    // Triangle 21
    drawTriangle(points1: spiralPoints4, points2: spiralPoints6, points3: spiralPoints8, fillColor: color.withAlphaComponent(alphaLevels[0]))
    
    // Triangle 22
    drawTriangle(points1: spiralPoints6, points2: spiralPoints7, points3: spiralPoints8, fillColor: color.withAlphaComponent(alphaLevels[2]))
    
    // Triangle 23
    drawTriangle(points1: spiralPoints6, points2: spiralPoints7, points3: spiralPoints18, fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    // Triangle 24
    drawTriangle(points1: spiralPoints7, points2: spiralPoints18, points3: spiralPoints20, fillColor: color.withAlphaComponent(alphaLevels[1]))
    
    // Triangle 25
    drawTriangle(points1: spiralPoints7, points2: spiralPoints20, points3: spiralPoints21, fillColor: color.withAlphaComponent(alphaLevels[0]))
    
    // Triangle 26
    drawTriangle(points1: spiralPoints7, points2: spiralPoints21, points3: spiralPoints22, fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    // Triangle 27
    drawTriangle(points1: spiralPoints7, points2: spiralPoints8, points3: spiralPoints22, fillColor: color.withAlphaComponent(alphaLevels[1]))
    
    // Triangle 28
    drawTriangle(points1: spiralPoints8, points2: spiralPoints22, points3: spiralPoints23, fillColor: color.withAlphaComponent(alphaLevels[3]))
    
    // Triangle 29
    drawTriangle(points1: spiralPoints8, points2: spiralPoints19, points3: spiralPoints23, fillColor: color.withAlphaComponent(alphaLevels[1]))
    
    // Triangle 30
    drawTriangle(points1: spiralPoints19, points2: spiralPoints23, points3: spiralPoints24, fillColor: color.withAlphaComponent(alphaLevels[4]))
    
    // Spin off background thread to set up all animations
    DispatchQueue.background(background: {

      self.animateBeziers.forEach({elem in
        var beziers: [UIBezierPath] = []

        for (i, point1) in elem.points1.enumerated() {
          beziers.append(self.createBezierPath(point1: point1, point2: elem.points2[i], point3: elem.points3[i]))
        }

        // Create group per each triangle
        let group = CAAnimationGroup()
        var animations: [CAAnimation] = []

        group.fillMode = kCAFillModeForwards
        group.isRemovedOnCompletion = false

        for i in 0...beziers.count-2 {
          let animation = CABasicAnimation(keyPath: "path")
          animation.fromValue = beziers[i].cgPath
          animation.toValue = beziers[i+1].cgPath
          animation.duration = animationTime
          animation.beginTime = CFTimeInterval(animationTime * Double(i))
          animation.isRemovedOnCompletion = false
          animation.fillMode = kCAFillModeForwards
          animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)

          animations.append(animation)
        }

        group.autoreverses = true
        group.animations = animations
        group.repeatCount = .infinity
        group.duration = CFTimeInterval(Double(animations.count) * animationTime)

        // Add to array to later start animations
        self.animateLayers.append(AnimateLayer(layer: elem.layer, animGroup: group))
      })
    }, completion: {
      self.animateLayers.forEach({animLayer in
        animLayer.layer.add(animLayer.animGroup, forKey: "anim")
      })
    })
  }
  
  /**
   Draw Triangle
   
   - Parameters:
   - points1: Array of CGPoints
   - points2: Array of CGPoints
   - points3: Array of CGPoints
   - fillColor: Fill color
   */
  private func drawTriangle(points1: [CGPoint], points2: [CGPoint], points3: [CGPoint], fillColor: UIColor) {
    
    guard let point1 = points1.first, let point2 = points2.first, let point3 = points3.first else {
      return
    }
    
    let path = createBezierPath(point1: point1, point2: point2, point3: point3)
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.lineWidth = 0
    shapeLayer.fillColor = fillColor.cgColor
    shapeLayer.shouldRasterize = true
    shapeLayer.rasterizationScale = UIScreen.main.scale
    
    self.layer.addSublayer(shapeLayer)
    
    animateBeziers.append(AnimatableElement(points1: points1, points2: points2, points3: points3, layer: shapeLayer))
  }
  
  /**
    Create triangle bezier path
   
    - Parameters:
      - point1: CGPoint 1
      - point2: CGPoint 2
      - point3: CGPoint 3
   
    - Returns: Triangle bezier path (UIBezierPath)
  */
  private func createBezierPath(point1: CGPoint, point2: CGPoint, point3: CGPoint) -> UIBezierPath {
    let bezierPath = UIBezierPath()
    
    bezierPath.move(to: point1)
    bezierPath.addLine(to: point2)
    bezierPath.addLine(to: point3)
    bezierPath.addLine(to: point1)
    bezierPath.close()
    
    return bezierPath
  }
  
  /**
    Create Triangle CAShapeLayer
   
    - Parameters:
      - path: UIBezierPath
      - fillColor: Color
   
    - Returns: CAShapeLayer with bezier path on it
  */
  func createTriangleLayer(path: UIBezierPath, fillColor: UIColor) -> CAShapeLayer {
    let shapeLayer = CAShapeLayer()
    
    shapeLayer.path = path.cgPath
    shapeLayer.lineWidth = 0
    shapeLayer.fillColor = fillColor.cgColor
    
    return shapeLayer
  }
  
  /**
    Create CGPoints on spiral
   
    - Parameters:
      - arc: Giving the length of arc between two points
      - separation: Giving the distance between consecutive turnings
      - numPoints: number of points
      - center: Center CGPoint
      - rotationDegrees: Rotation of spiral
      - invert: Invert spiral, default false
   
    - Returns: Array of CGPoint [{0;0}, ....]
   
  */
  private func createPointsOnSpiral(arc: Double, separation: Double, numPoints: Int, center: CGPoint, rotationDegrees: CGFloat = 0, invert: Bool = false) -> [CGPoint] {
    
    /**
     generate points on an Archimedes' spiral
     with `arc` giving the length of arc between two points
     and `separation` giving the distance between consecutive
     turnings
     - approximate arc length with circle arc at given distance
     - use a spiral equation r = b * phi
     **/
    
    var numPoints = numPoints
    
    /**
      Rotate point
     
      - Parameters:
        - target: Target CGPoint
        - origin: Around CGPoint
        - byDegrees: Rotate by degrees in CGFloat
     
      - Returns: Return rotated CGPoint
    */
    func rotatePoint(target: CGPoint, aroundOrigin origin: CGPoint, byDegrees: CGFloat) -> CGPoint {
      let dx = target.x - origin.x
      let dy = target.y - origin.y
      let radius = sqrt(dx * dx + dy * dy)
      let azimuth = atan2(dy, dx) // in radians
      let newAzimuth = azimuth + byDegrees * CGFloat(Double.pi/180.0) // convert it to radians
      let x = origin.x + radius * cos(newAzimuth)
      let y = origin.y + radius * sin(newAzimuth)
      return CGPoint(x: x, y: y)
    }
    
    /**
      Convert polar to cartesian
     
      - Parameters:
        - r: Double
        - phi: Double
     
      - Returns: Converted CGPoint
    */
    func p2c(radius: Double, phi: Double) -> CGPoint {
      
      var x = radius * cos(phi)
      var y = radius * sin(phi)
      
      // If need to invert the spiral
      if invert {
        let tmpX = x
        x = -y
        y = -tmpX
      }
      
      return rotatePoint(target: CGPoint(x: CGFloat(x) + center.x, y: CGFloat(y) + center.y), aroundOrigin: center, byDegrees: rotationDegrees)
    }
    
    // yield a point at origin
    var result = [CGPoint(x: 0 + center.x, y: 0 + center.y)]
    
    // initialize the next point in the required distance
    var r = arc
    let b = separation / (2 * .pi)
    
    // find the first phi to satisfy distance of `arc` to the second point
    var phi = r / b
    
    while numPoints > 0 {
      result.append(p2c(radius: r, phi: phi))
      
      //      advance the variables
      //      calculate phi that will give desired arc length at current radius
      //      (approximating with circle)
      
      phi += arc / r
      r = b * phi
      numPoints -= 1
    }
    
    return result
  }
}

// MARK: DispatchQueue extensions
extension DispatchQueue {
  
  /**
   Start background thread
   
   - Parameters:
   - delay: Delay in seconds, default 0.0
   - background: Block to execute in background
   - completion: Completion block
   */
  static func background(delay: Double = 0.0, background: (() -> Void)? = nil, completion: (() -> Void)? = nil) {
    DispatchQueue.global(qos: .background).async {
      background?()
      
      if let completion = completion {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
          completion()
        })
      }
    }
  }
  
}

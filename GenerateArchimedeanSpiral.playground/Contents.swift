import UIKit
import PlaygroundSupport

let viewSize: CGFloat = 550
let view = UIView(frame: CGRect(x: 0, y: 0, width: viewSize, height: viewSize))
view.backgroundColor = .white

PlaygroundPage.current.liveView = view

/// Polar to cortesian coordinates
func p2c(radius: Double, phi: Double) -> CGPoint {
  
  let x = radius * cos(phi)
  let y = radius * sin(phi)
  
  return CGPoint(x: CGFloat(x), y: CGFloat(y))
}

/// Create points on spiral
private func createPointsOnSpiral(arc: Double, separation: Double, numPoints: Int) -> [CGPoint] {
  var numPoints = numPoints
  
  // yield a point at origin
  var result = [CGPoint(x: 0, y: 0)]
  
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

let points = createPointsOnSpiral(arc: 20, separation: 20, numPoints: 500)

let centerPoint = CGPoint(x: view.frame.width/2, y: view.frame.height/2)

let radius: CGFloat = 6

var linePath = UIBezierPath()
var movedToStart = false


points.forEach { point in
  if !movedToStart {
    linePath.move(to: CGPoint(x: point.x + centerPoint.x,
                              y: point.y + centerPoint.y))
    movedToStart = true
  } else {
    linePath.addLine(to: CGPoint(x: point.x + centerPoint.x,
                               y: point.y + centerPoint.y))
  }
  
  let circleRect = CGRect(x: point.x + centerPoint.x - radius/2,
                          y: point.y + centerPoint.y - radius/2,
                          width: radius,
                          height: radius)
  let dotPath = UIBezierPath(ovalIn: circleRect)

  let layer = CAShapeLayer()
  layer.path = dotPath.cgPath
  layer.strokeColor = UIColor.black.cgColor
  view.layer.addSublayer(layer)
}


let shapeLayer = CAShapeLayer()
shapeLayer.path = linePath.cgPath
shapeLayer.strokeColor = UIColor.black.cgColor
shapeLayer.lineWidth = 1.0
shapeLayer.fillColor = UIColor.clear.cgColor

view.layer.addSublayer(shapeLayer)

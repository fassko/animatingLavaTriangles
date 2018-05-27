import UIKit

func p2c(radius: Double, phi: Double) -> CGPoint {
  
  var x = radius * cos(phi)
  var y = radius * sin(phi)
  
  return CGPoint(x: CGFloat(x), y: CGFloat(y))
}

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

let points = createPointsOnSpiral(arc: 20, separation: 1, numPoints: 30)

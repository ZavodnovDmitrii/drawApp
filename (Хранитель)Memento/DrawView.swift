
import UIKit

class DrawView: UIView {
    var carrientState: CarrientState!
    
    var lineWidht: CGFloat!
    var lineColor: UIColor!
    var startLine: CGPoint!
    var endLine: CGPoint!
    var path: UIBezierPath!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSublayers(of layer: CALayer) {
        lineWidht = 10.0
        let line = LinesManager.shared
        carrientState = CarrientState(linesManager: line)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startLine = touch?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        endLine = touch?.location(in: self)
        carrientState.linesManager.currentLinesArray.append(LineModel(startLine: startLine, endLine: endLine, colorLine: lineColor))
        
        path = UIBezierPath()
        path.move(to: startLine)
        path.addLine(to: endLine)
        startLine = endLine
        
        drawShapeLayer()
    }
    
    private func drawShapeLayer() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
}

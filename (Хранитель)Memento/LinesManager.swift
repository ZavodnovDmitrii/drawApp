
import UIKit

class LinesManager {
    static let shared = LinesManager()
    var currentLinesArray = [LineModel]()
    
    private init() {}
    
    func saveLines() -> StateLinesMemento {
        return StateLinesMemento(lines: currentLinesArray)
    }
    
    func loadLastLines(state: StateLinesMemento) {
        self.currentLinesArray = state.linesArray
    }
    
    func printLines(view: UIView) {
        for v in view.layer.sublayers! {
            v.removeFromSuperlayer()
        }
        
        for line in currentLinesArray {
            let path = UIBezierPath()
            path.move(to: line.startLine)
            path.addLine(to: line.endLine)
            
            drawShapeLayer(path, line.colorLine, view)
        }
    }
    
    private func drawShapeLayer(_ path: UIBezierPath, _ lineColor: UIColor, _ view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(shapeLayer)
        view.setNeedsDisplay()
    }
}

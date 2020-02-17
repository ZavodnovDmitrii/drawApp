
import UIKit

struct LineModel {
    var startLine: CGPoint
    var endLine: CGPoint
    var colorLine: UIColor
    
    init(startLine: CGPoint, endLine: CGPoint, colorLine: UIColor) {
        self.startLine = startLine
        self.endLine = endLine
        self.colorLine = colorLine
    }
}


import UIKit

class CarrientState {
    var stateMemento: StateLinesMemento?
    let linesManager: LinesManager
    
    init(linesManager: LinesManager) {
        self.linesManager = linesManager
    }
    
    public func saveLine() {
        stateMemento = linesManager.saveLines()
    }
    
    public func loadLine() {
        guard stateMemento != nil else { return }
        linesManager.loadLastLines(state: stateMemento!)
    }
    
    public func clean(view: UIView) {
        linesManager.currentLinesArray.removeAll()
        linesManager.printLines(view: view)
    }
}

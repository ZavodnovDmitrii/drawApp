
import Foundation

class StateLinesMemento {
    var linesArray = [LineModel]()
    
    init(lines: [LineModel]) {
        self.linesArray = lines
    }
}

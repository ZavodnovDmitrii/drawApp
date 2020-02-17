
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewBoard: DrawView!
    
    var carrierState: CarrientState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBoard.lineColor = .black
        
        let line = LinesManager.shared
        carrierState = CarrientState(linesManager: line)
        
    }
    
    @IBAction func save(_ sender: Any) {
        carrierState.saveLine()
    }
    
    @IBAction func clean(_ sender: Any) {
        carrierState.clean(view: viewBoard)
    }
    
    @IBAction func lastLoad(_ sender: Any) {
        carrierState.loadLine()
        LinesManager.shared.printLines(view: viewBoard)
    }
    
    @IBAction func black(_ sender: Any) {
        viewBoard.lineColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func blue(_ sender: Any) {
        viewBoard.lineColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
    }
    
    @IBAction func red(_ sender: Any) {
        viewBoard.lineColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    }
    
    @IBAction func ellow(_ sender: Any) {
        viewBoard.lineColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    }
    
    @IBAction func brown(_ sender: Any) {
        viewBoard.lineColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
    }
}



import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textData: UITextView!
    @IBOutlet weak var close: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }
    

}

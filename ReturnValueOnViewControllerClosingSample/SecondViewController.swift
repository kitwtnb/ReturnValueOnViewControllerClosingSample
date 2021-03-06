import Promises
import UIKit

class SecondViewController: UIViewController {
    @IBOutlet private weak var textField: UITextField!

    private var promise: Promise<String>?

    func returnValue() -> Promise<String> {
        let p = Promise<String>.pending()
        promise = p
        return p
    }

    @IBAction func didTapButton(_ sender: Any) {
        if let value = textField.text {
            promise?.fulfill(value)
        }
        navigationController?.popViewController(animated: true)
    }
}

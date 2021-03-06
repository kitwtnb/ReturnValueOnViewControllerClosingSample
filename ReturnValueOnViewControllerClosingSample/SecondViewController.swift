import UIKit

class SecondViewController: UIViewController {
    @IBOutlet private weak var textField: UITextField!

    private let returnValue: (String) -> Void

    required init?(coder: NSCoder) { fatalError() }

    init?(coder: NSCoder, returnValue: @escaping (String) -> Void) {
        self.returnValue = returnValue
        super.init(coder: coder)
    }

    @IBAction func didTapButton(_ sender: Any) {
        if let value = textField.text {
            returnValue(value)
        }
        navigationController?.popViewController(animated: true)
    }
}

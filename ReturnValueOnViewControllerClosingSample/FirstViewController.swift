import Promises
import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    @IBAction func didTapButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "SecondViewController", creator: { coder in
            SecondViewController(coder: coder)
        }) else { return }

        navigationController?.pushViewController(vc, animated: true)

        Promise(on: DispatchQueue.global()) {
            // Worker Thread
            try await(vc.returnValue())
        }.then { [weak self] returnValue in
            // UI Thread
            self?.label.text = returnValue
        }
    }
}

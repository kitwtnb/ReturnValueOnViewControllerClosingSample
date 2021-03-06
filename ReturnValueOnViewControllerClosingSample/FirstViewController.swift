import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    @IBAction func didTapButton(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "SecondViewController", creator: { coder in
            SecondViewController(coder: coder) { [weak self] in
                self?.label.text = $0
            }
        }) else { return }

        navigationController?.pushViewController(vc, animated: true)
    }
}

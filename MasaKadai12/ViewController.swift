//
//  ViewController.swift
//  MasaKadai12
//
//  Created by Mina on 2023/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var inputNumberTextField1: UITextField!
    @IBOutlet private weak var inputNumberTextField2: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = UserDefaults.standard.string(forKey: "text") {
            inputNumberTextField2.text = text
        }
    }

    @IBAction private func calcButton(_ sender: Any) {

        let numberInput1 = Double(inputNumberTextField1.text ?? "") ?? 0
        let numberInput2 = Double(inputNumberTextField2.text ?? "") ?? 0

        let tax = numberInput2 * 0.01
        let zeiritu = tax + 1.0
        let total = (numberInput1 * zeiritu)

        UserDefaults.standard.set(inputNumberTextField2.text, forKey: "text")
        resultLabel.text = String(format: "%.0f", total)
    }
}

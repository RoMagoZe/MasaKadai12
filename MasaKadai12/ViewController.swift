//
//  ViewController.swift
//  MasaKadai12
//
//  Created by Mina on 2023/04/21.
//

import UIKit

class ViewController: UIViewController {

    /// 税抜金額
    @IBOutlet private weak var amountExclusiveOfTaxTextField: UITextField!

    /// 消費税率
    @IBOutlet private weak var consumptionTaxRateTextField: UITextField!

    @IBOutlet private weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let consumptionTaxRate = UserDefaults.standard.string(forKey: "consumptionTaxRate") {
            consumptionTaxRateTextField.text = consumptionTaxRate
        }
    }

    @IBAction private func calcButton(_ sender: Any) {

        let amountExclusiveOfTax = Double(amountExclusiveOfTaxTextField.text ?? "") ?? 0
        let consumptionTaxRate = Double(consumptionTaxRateTextField.text ?? "") ?? 0

        let tax = consumptionTaxRate * 0.01
        let zeiritu = tax + 1.0
        let total = (amountExclusiveOfTax * zeiritu)

        UserDefaults.standard.set(consumptionTaxRateTextField.text, forKey: "consumptionTaxRate")
        resultLabel.text = String(format: "%.0f", total)
    }
}

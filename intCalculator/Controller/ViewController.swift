//
//  ViewController.swift
//  intCalculator
//
//  Created by Lee on 3/26/25.
//

import UIKit

class ViewController: UIViewController, AlertViewDelegate {

    let calculaterView = CalculaterView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = calculaterView
        calculaterView.delegate = self
    }

    func makeAlert(_ message: String) {
        let alert = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }

    func showAlert(_ message: String) {
        makeAlert(message)
    }
}

//
//  ViewController.swift
//  intCalculator
//
//  Created by Lee on 3/26/25.
//

import UIKit

class ViewController: UIViewController {

    private var number = 12345

    var arrButtons: [UIButton] = []

    var titles = ["7", "8", "9", "+"]

    let label = UILabel()
    let button = UIButton()
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        arrButtons = setButton(titles, button)
        view.backgroundColor = .black

        label.text = "\(number)"
        label.textAlignment = .right
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 60)

        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually

        // arrViews에서 담겨진 [UIButton]을 하나씩 순차적으로 담아주면 되지 않을까?
        stackView.addArrangedSubview(arrButtons[0])
        stackView.addArrangedSubview(arrButtons[1])
        stackView.addArrangedSubview(arrButtons[2])
        stackView.addArrangedSubview(arrButtons[3])

        [label, stackView].forEach { view.addSubview($0) }

        [label, stackView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.heightAnchor.constraint(equalToConstant: 100),

            stackView.heightAnchor.constraint(equalToConstant: 80),
            stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 60),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    // Title자리만 바꿔주고 싶다.
    func setButton(_ titles : [String], _ button: UIButton) -> [UIButton] {
        for title in titles {
            let button = UIButton()
            button.setTitle("\(title)", for: .normal)
            arrButtons.append(button)
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.layer.cornerRadius = 40
        }
        return arrButtons
    }
}

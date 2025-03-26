//
//  ViewController.swift
//  intCalculator
//
//  Created by Lee on 3/26/25.
//

import UIKit

class ViewController: UIViewController {

    private var number = 12345

    var arrViews: [UIView] = []

    let label = UILabel()
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    let plusButton = UIButton()
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .black

        label.text = "\(number)"
        label.textAlignment = .right
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 60)

        button7.setTitle("7", for: .normal)
        button7.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button7.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button7.layer.cornerRadius = 40

        button8.setTitle("8", for: .normal)
        button8.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button8.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button8.layer.cornerRadius = 40

        button9.setTitle("9", for: .normal)
        button9.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button9.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button9.layer.cornerRadius = 40

        plusButton.setTitle("+", for: .normal)
        plusButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
        plusButton.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        plusButton.layer.cornerRadius = 40

        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually

        stackView.addArrangedSubview(button7)
        stackView.addArrangedSubview(button8)
        stackView.addArrangedSubview(button9)
        stackView.addArrangedSubview(plusButton)

        [label, stackView].forEach { view.addSubview($0) }

        [label, stackView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.heightAnchor.constraint(equalToConstant: 100),

            button7.heightAnchor.constraint(equalToConstant: 80),
            button7.widthAnchor.constraint(equalToConstant: 80),

            button8.heightAnchor.constraint(equalToConstant: 80),
            button8.widthAnchor.constraint(equalToConstant: 80),

            button9.heightAnchor.constraint(equalToConstant: 80),
            button9.widthAnchor.constraint(equalToConstant: 80),

            stackView.heightAnchor.constraint(equalToConstant: 80),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}


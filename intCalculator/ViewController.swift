//
//  ViewController.swift
//  intCalculator
//
//  Created by Lee on 3/26/25.
//

import UIKit

class ViewController: UIViewController {

    private var number = 12345

    let label = UILabel()
    var stackView1 = UIStackView()
    var stackView2 = UIStackView()

    let arr = [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "*"],
        ["AC", "0", "=", "/"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureStackView()

    }
    func configureStackView() {
        self.stackView1 = makeHorizontalStackView(arr[0])
        self.stackView2 = makeHorizontalStackView(arr[1])
        
        for i in arr {
            stackView1 =  makeHorizontalStackView(i)
            break
        }
        view.addSubview(stackView1)
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 60),
            stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
    }

    func makeHorizontalStackView(_ buttonTitles: [String]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 80),
        ])

        for buttonTitle in buttonTitles {
            let button = UIButton()
            button.setTitle(buttonTitle, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.layer.cornerRadius = 40

            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 80),
                button.widthAnchor.constraint(equalToConstant: 80)
            ])

            stackView.addArrangedSubview(button)
        }

        return stackView
    }

    private func configureUI() {
        view.backgroundColor = .black

        label.text = "\(number)"
        label.textAlignment = .right
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 60)

        view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            label.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

// 이근나 T 피드백
// 4개의 열을 만들기
// 수평으로 쌓이는 스택뷰 - 4개
// 버튼 1개를 재사용이 가능한 상태로 바꾸기
// 16개의 버튼을 만들기

// 버튼을 만들어서 스택뷰에 넣는거 자체를 하나로 만들거나 << 얘로 방향을 잡고 시작.
// 버튼 만들기 / 스택뷰 만들기
// 버튼에 태그 (있는지 확인만)

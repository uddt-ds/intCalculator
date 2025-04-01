//
//  CalculaterView.swift
//  intCalculator
//
//  Created by Lee on 4/1/25.
//

import UIKit

protocol AlertViewDelegate {
    func showAlert(_ message: String)
}

class CalculaterView: UIView {

    var delegate: AlertViewDelegate?

    let dataModel = DataModel()

    var number = "0"

    let label = UILabel()
    let button = UIButton()

    private var titles = [
        ["7", "8", "9", "+"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "*"],
        ["AC", "0", "=", "/"]
    ]

    private var stackView1 = UIStackView()
    private var stackView2 = UIStackView()
    private var stackView3 = UIStackView()
    private var stackView4 = UIStackView()

    private var verticalStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setLabel() {
        self.backgroundColor = .black

        label.text = number
        label.textAlignment = .right
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 60)

        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            label.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    // Label과 버튼, StackView를 생성하는 함수
    func setUI() {
        setLabel()

        let setButton1 = setButton(titles[0], #selector(buttonTapped), button)
        let setButton2 = setButton(titles[1], #selector(buttonTapped), button)
        let setButton3 = setButton(titles[2], #selector(buttonTapped), button)
        let setButton4 = setButton(titles[3], #selector(buttonTapped), button)

        stackView1 = makeHorizontalStackView(setButton1)
        stackView2 = makeHorizontalStackView(setButton2)
        stackView3 = makeHorizontalStackView(setButton3)
        stackView4 = makeHorizontalStackView(setButton4)

        let arrStackView = fourStackView()
        verticalStackView = makeVerticalStackView(arrStackView)
    }

    // 타이틀이 바뀌어 적용되는 버튼을 만들고 배열로 묶어주는 함수
    private func setButton(_ titles : [String], _ action: Selector, _ button: UIButton) -> [UIButton] {
        var arrButtons: [UIButton] = []
        let operate = ["+", "-", "*", "AC", "=", "/"]

        for title in titles {
            let button = UIButton()
            button.addTarget(self, action: action, for: .touchDown)
            button.setTitle(title, for: .normal)
            // 연산자만 오렌지 컬러로 변경
            if !operate.contains(title) {
                button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            } else {
                button.backgroundColor = UIColor.orange
            }
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)

            button.layer.cornerRadius = 40
            arrButtons.append(button)
        }
        return arrButtons
    }

    // 4개의 버튼 배열을 묶어서 1개의 스택뷰로 만들어주는 함수
    private func makeHorizontalStackView(_ views: [UIButton]) -> UIStackView {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.backgroundColor = .black
        horizontalStackView.spacing = 10
        horizontalStackView.distribution = .fillEqually

        horizontalStackView.addArrangedSubview(views[0])
        horizontalStackView.addArrangedSubview(views[1])
        horizontalStackView.addArrangedSubview(views[2])
        horizontalStackView.addArrangedSubview(views[3])

        self.addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            horizontalStackView.heightAnchor.constraint(equalToConstant: 80)
        ])

        return horizontalStackView
    }

    // 4개의 스택뷰를 묶어서 배열로 리턴하는 함수
    private func fourStackView() -> [UIStackView] {
        let arrStackView = [stackView1, stackView2, stackView3, stackView4]
        return arrStackView
    }

    // 스택뷰 배열을 받아서 UIStackView로 리턴하는 함수 (여기서 Vertical StackView로 전환)
    private func makeVerticalStackView(_ stackViews: [UIStackView]) -> UIStackView {
        verticalStackView.axis = .vertical
        verticalStackView.backgroundColor = .black
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually

        verticalStackView.addArrangedSubview(stackViews[0])
        verticalStackView.addArrangedSubview(stackViews[1])
        verticalStackView.addArrangedSubview(stackViews[2])
        verticalStackView.addArrangedSubview(stackViews[3])

        self.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            verticalStackView.widthAnchor.constraint(equalToConstant: 350),
            verticalStackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 60),
            verticalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        return verticalStackView
    }

    // 버튼 누르고 난 뒤 작동하는 로직
    @objc
    private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        switch title {
        case "=":
            guard number.suffix(2) != "/0" && number.suffix(2) != "0/" else {
                delegate?.showAlert("0으로 나누기 연산을 할 수 없습니다.")
                return
            }
            guard number.last != "+" && number.last != "-" && number.last != "/" && number.last != "*" else {
                delegate?.showAlert("올바르지 않은 연산은 할 수가 없습니다.")
                return
            }
            guard let result = dataModel.calculate(expression: number) else {
                return
            }
            number = "\(result)"
            label.text = "\(number)"
        case "AC":
            number = "0"
            label.text = "\(number)"
        case "+" :
            if number.last != "+" && number.last != "-" && number.last != "/" && number.last != "*" {
                number += title
                label.text = "\(number)"
            } else {
                delegate?.showAlert("연산자를 2개 이상 사용할 수 없습니다.")
                label.text = "\(number)"
            }
        case "-" :
            if number.last != "+" && number.last != "-" && number.last != "/" && number.last != "*" {
                number += title
                label.text = "\(number)"
            } else {
                delegate?.showAlert("연산자를 2개 이상 사용할 수 없습니다.")
                label.text = "\(number)"
            }
        case "/" :
            if number.last != "+" && number.last != "-" && number.last != "/" && number.last != "*" {
                number += title
                label.text = "\(number)"
            } else {
                delegate?.showAlert("연산자를 2개 이상 사용할 수 없습니다.")
                label.text = "\(number)"
            }
        case "*" :
            if number.last != "+" && number.last != "-" && number.last != "/" && number.last != "*" {
                number += title
                label.text = "\(number)"
            } else {
                delegate?.showAlert("연산자를 2개 이상 사용할 수 없습니다.")
                label.text = "\(number)"
            }
        default:
            number += title
            if number.first == "0" {
                number.removeFirst()
            }
            label.text = "\(number)"
        }
    }
}

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
    let button = UIButton()

    private var titles = [["7", "8", "9", "+"], ["4", "5", "6", "-"], ["1", "2", "3", "*"], ["AC", "0", "=", "/"]]

    private var verticalStackView = UIStackView()
    private var stackView1 = UIStackView()
    private var stackView2 = UIStackView()
    private var stackView3 = UIStackView()
    private var stackView4 = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        setUI()
    }

    private func setLabel() {
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

    func setUI() {
        let setButton1 = setButton(titles[0], button)
        let setButton2 = setButton(titles[1], button)
        let setButton3 = setButton(titles[2], button)
        let setButton4 = setButton(titles[3], button)

        stackView1 = makeHorizontalStackView(setButton1)
        stackView2 = makeHorizontalStackView(setButton2)
        stackView3 = makeHorizontalStackView(setButton3)
        stackView4 = makeHorizontalStackView(setButton4)

        let arrStackView = fourStackView()
        verticalStackView = makeVerticalStackView(arrStackView)
    }

    // 타이틀이 바뀌어 적용되는 버튼을 만들고 배열로 묶어주는 함수
    private func setButton(_ titles : [String], _ button: UIButton) -> [UIButton] {
        var arrButtons: [UIButton] = []
        let operate = ["+", "-", "*", "AC", "=", "/"]

        for title in titles {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            // 만약에 title이 operate의 요소를 포함하고 있지 않으면
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

        view.addSubview(horizontalStackView)
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

        view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            verticalStackView.widthAnchor.constraint(equalToConstant: 350),
            verticalStackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 60),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        return verticalStackView
    }
}

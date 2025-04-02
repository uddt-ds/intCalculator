//
//  SplashViewController.swift
//  intCalculator
//
//  Created by Lee on 4/1/25.
//

import UIKit

// 앱 실행할 때 띄워주는 런치뷰
class SplashViewController: UIViewController {

    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit

        imageView.image = UIImage(named: "logoImage")

        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

// 런치뷰 설정
extension SplashViewController {
    private func setUI() {
        view.backgroundColor = .black

        view.addSubview(logoImage)

        logoImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

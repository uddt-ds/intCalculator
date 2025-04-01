//
//  SplashViewController.swift
//  intCalculator
//
//  Created by Lee on 4/1/25.
//

import UIKit

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

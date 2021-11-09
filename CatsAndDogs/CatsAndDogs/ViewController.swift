//
//  ViewController.swift
//  CatsAndDogs
//
//  Created by a.akhmadiev on 09.11.2021.
//

import SnapKit
import UIKit

class ViewController: UIViewController {

    // MARK: Private data structure

    private enum Constants {
        static let defaultInsets: CGFloat = 16
        static let segmentTop: CGFloat = 32
        static let contentHeight: CGFloat = 200
        static let contentTop: CGFloat = 40
        static let labelHeight: CGFloat = 46
        static let buttonLeading: CGFloat = 112
        static let buttonHeight: CGFloat = 40

        static let borderWidth: CGFloat = 1
        static let contentCornerRadius: CGFloat = 10
        static let buttonCornerRadius: CGFloat = 20
    }


    // MARK: Private properties

    private let segmentedControl = UISegmentedControl(items: ["Cats", "Dogs"])
    let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "Content"
        label.numberOfLines = 0
        return label
    }()
    private let contentImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleToFill
        view.layer.masksToBounds = false
        view.layer.borderWidth = Constants.borderWidth
        view.layer.cornerRadius = Constants.contentCornerRadius
        return view
    }()
    private let moreButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 1, green: 0.609, blue: 0.542, alpha: 1)
        button.setTitle("More", for: .normal)
        button.layer.cornerRadius = Constants.buttonCornerRadius
        return button
    }()
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Score: 0 cats and 0 dogs"
        return label
    }()
    private var viewModel = ViewModel()




    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupNavigationBar()
        view.backgroundColor = .white
    }


    // MARK: Private

    private func setupView() {
        view.addSubview(segmentedControl)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(didChangeIndexForSegmentedControl), for: .valueChanged)
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Constants.defaultInsets)
            $0.centerX.equalToSuperview()
        }

        view.addSubview(contentImageView)
        contentImageView.snp.makeConstraints {
            $0.height.equalTo(Constants.contentHeight)
            $0.leading.trailing.equalToSuperview().inset(Constants.defaultInsets)
            $0.top.equalTo(self.segmentedControl.snp.bottom).offset(Constants.contentTop)
        }

        contentImageView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        view.addSubview(moreButton)
        moreButton.snp.makeConstraints {
            $0.height.equalTo(Constants.buttonHeight)
            $0.leading.trailing.equalToSuperview().inset(Constants.buttonLeading)
            $0.top.equalTo(contentImageView.snp.bottom).offset(Constants.defaultInsets)
        }

        view.addSubview(scoreLabel)
        scoreLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(Constants.defaultInsets)
            $0.top.equalTo(self.moreButton.snp.bottom).offset(Constants.defaultInsets)
            $0.height.equalTo(Constants.labelHeight)
        }
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Cats and dogs"
    }

    @objc private func didChangeIndexForSegmentedControl() {
        let index = segmentedControl.selectedSegmentIndex
        if index == 0 {

        } else {

        }
    }

    @objc private func moreButtonTapped() {
        let index = segmentedControl.selectedSegmentIndex
        if index == 0 {

        } else {

        }
    }
}


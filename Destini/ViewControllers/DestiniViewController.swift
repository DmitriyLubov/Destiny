//
//  DestiniViewController.swift
//  Destini
//
//  Created by Дмитрий Лубов on 06.06.2024.
//

import UIKit
#if DEBUG
import SwiftUI
#endif

final class DestiniViewController: UIViewController {
	
	// MARK: - Outlets
	
	// MARK: - Public properties
	
	// MARK: - Dependencies
	
	// MARK: - Private properties

	private lazy var mainBackgroundImage: UIImageView = makeImage()
	private lazy var mainStackView: UIStackView = makeStackView()

	private lazy var storyLabel: UILabel = makeLabel()
	private lazy var choiceOneButton: UIButton = makeButton()
	private lazy var choiceTwoButton: UIButton = makeButton()

	// MARK: - Initialization
	
	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		layout()
	}

	// MARK: - Public methods
	
	// MARK: - Private methods
}

// MARK: - Actions

private extension DestiniViewController {
	
}

// MARK: - Setup UI

private extension DestiniViewController {

	func setupUI() {
		addSubviews()

		setupChoiceOneButton()
		setupChoiceTwoButton()
	}

	func makeImage() -> UIImageView {
		let element = UIImageView()

		element.image = Images.mainBackground
		element.contentMode = .scaleAspectFill
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeStackView() -> UIStackView {
		let element = UIStackView()

		element.axis = .vertical
		element.spacing = Sizes.spacing
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeLabel() -> UILabel {
		let element = UILabel()

		element.font = .preferredFont(forTextStyle: .title1)
		element.textColor = .white
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}

	func makeButton() -> UIButton {
		let element = UIButton()

		element.configuration = .plain()
		element.configuration?.baseForegroundColor = .white
		element.configuration?.cornerStyle = .large
		element.translatesAutoresizingMaskIntoConstraints = false

		return element
	}
}

// MARK: - Setting UI

private extension DestiniViewController {

	func addSubviews() {
		view.addSubview(mainBackgroundImage)
		view.addSubview(mainStackView)

		mainStackView.addArrangedSubview(storyLabel)
		mainStackView.addArrangedSubview(choiceOneButton)
		mainStackView.addArrangedSubview(choiceTwoButton)
	}

	func setupChoiceOneButton() {
		choiceOneButton.configuration?.background.image = Images.pinkButtonBackground
	}

	func setupChoiceTwoButton() {
		choiceTwoButton.configuration?.background.image = Images.violetButtonBackground
	}
}

// MARK: - Layout UI

private extension DestiniViewController {

	func layout() {
		NSLayoutConstraint.activate([
			mainBackgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
			mainBackgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			mainBackgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			mainBackgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),

			mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			mainStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
			mainStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
			mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

			choiceOneButton.heightAnchor.constraint(equalToConstant: Sizes.height),
			choiceTwoButton.heightAnchor.constraint(equalToConstant: Sizes.height)
		])
	}
}

#if DEBUG
struct ViewControllerProvider: PreviewProvider {
	static var previews: some View {
		Group {
			DestiniViewController().previw()
		}
	}
}
#endif

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

	// MARK: - Dependencies

	private var destinyManager: DestinyManager

	// MARK: - Private properties

	private lazy var mainBackgroundImage: UIImageView = makeImage()
	private lazy var mainStackView: UIStackView = makeStackView()

	private lazy var storyLabel: UILabel = makeLabel()
	private lazy var choiceOneButton: UIButton = makeButton()
	private lazy var choiceTwoButton: UIButton = makeButton()

	// MARK: - Initialization

	init(destinyManager: DestinyManager) {
		self.destinyManager = destinyManager
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		updateUI()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		layout()
	}

	// MARK: - Private methods

	private func updateUI() {
		storyLabel.text = destinyManager.getContent()

		let choices = destinyManager.getChoices()
		updateButtonTitle(choices[0], for: choiceOneButton)
		updateButtonTitle(choices[1], for: choiceTwoButton)
	}

	private func updateButtonTitle(_ title: String, for button: UIButton) {
		button.configuration?.attributedTitle = AttributedString(title)
		button.configuration?.attributedTitle?.font = .preferredFont(forTextStyle: .title1)
	}
}

// MARK: - Actions

private extension DestiniViewController {

	func choiceMade() -> UIAction {
		UIAction { [weak self] action in
			guard let sender = action.sender as? UIButton, let choice = sender.configuration?.title else { return }

			self?.destinyManager.nextStory(choice)
			self?.updateUI()
		}
	}
}

// MARK: - Setup UI

private extension DestiniViewController {

	func setupUI() {
		addSubviews()
		addActions()

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
		element.numberOfLines = 0
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

	func addActions() {
		choiceOneButton.addAction(choiceMade(), for: .touchUpInside)
		choiceTwoButton.addAction(choiceMade(), for: .touchUpInside)
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
			DestiniViewController(destinyManager: DestinyManager(stories: StoryRepository().getStories())).previw()
		}
	}
}
#endif

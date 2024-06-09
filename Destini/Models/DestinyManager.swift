//
//  DestinyManager.swift
//  Destini
//
//  Created by Дмитрий Лубов on 09.06.2024.
//

/// Менеджер судьбы
struct DestinyManager {

	// MARK: - Dependencies

	private let stories: [Story]

	// MARK: - Private properties

	private var storyNumber = 0

	// MARK: - Initialization

	init(stories: [Story]) {
		self.stories = stories
	}

	// MARK: - Public methods

	/// Возвращает содержание истории
	/// - Returns: текст истории
	func getContent() -> String {
		stories[storyNumber].content
	}

	/// Возвращает варианты развития истории
	/// - Returns: массив вариантов
	func getChoices() -> [String] {
		stories[storyNumber].choices
	}

	/// Переход к следующей истории в зависимости от выбора
	/// - Parameter choice: выбор, по результатам которого будет развиваться история
	mutating func nextStory(_ choice: String) {
		if choice == stories[storyNumber].choices[0] {
			storyNumber = stories[storyNumber].nextStories[0]
		} else {
			storyNumber = stories[storyNumber].nextStories[1]
		}
	}
}

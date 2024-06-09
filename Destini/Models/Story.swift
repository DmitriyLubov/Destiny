//
//  Story.swift
//  Destini
//
//  Created by Дмитрий Лубов on 09.06.2024.
//

/// Модель истории
struct Story {

	/// Содержание истории
	let content: String

	/// Варианты выбора развития истории
	let choices: [String]

	/// Следующие истории
	let nextStories: [Int]
}

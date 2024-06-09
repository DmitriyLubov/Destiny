//
//  SceneDelegate.swift
//  Destini
//
//  Created by Дмитрий Лубов on 06.06.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }

		let window = UIWindow(windowScene: windowScene)
		window.rootViewController = DestiniViewController(destinyManager: buildDestinyManager())
		window.makeKeyAndVisible()

		self.window = window
	}
}

private extension SceneDelegate {

	func buildDestinyManager() -> DestinyManager {
		let repository: IStoryRepository = StoryRepository()
		let manager = DestinyManager(stories: repository.getStories())

		return manager
	}
}

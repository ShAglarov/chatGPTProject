//
//  SceneDelegate.swift
//  chatGPTProject
//
//  Created by Shamil Aglarov on 22.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Убедитесь, что сцена является UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Инициализация UIWindow с windowScene
        let window = UIWindow(windowScene: windowScene)

        // Создание нового экземпляра ViewController
        let viewController = ViewController()

        // Установка rootViewController для окна
        window.rootViewController = viewController

        // Сделайте это окно видимым
        self.window = window
        window.makeKeyAndVisible()

        guard let _ = (scene as? UIWindowScene) else { return }
    }

    // Остальные методы сцены...
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}


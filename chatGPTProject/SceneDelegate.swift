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
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        
        // Создаем экземпляр ViewController
        let viewController = ViewController()
        
        // Оборачиваем ViewController в UINavigationController
        let navigationController = UINavigationController(rootViewController: viewController)

        // Устанавливаем UINavigationController как rootViewController
        window.rootViewController = navigationController

        self.window = window
        window.makeKeyAndVisible()
    }

    // Остальные методы сцены...
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}


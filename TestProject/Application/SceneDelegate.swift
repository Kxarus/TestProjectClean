//
//  SceneDelegate.swift
//  TestProject
//
//  Created by Roman Kiruxin on 17.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let vc = TabBarViewController()
        let navigation = UINavigationController(rootViewController: vc)
        navigation.isNavigationBarHidden = true
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
        self.window = window
    }

}

//
//  SceneDelegate.swift
//  CryptoChecker
//
//  Created by L Daniel De San Pedro on 11/02/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = scene as? UIWindowScene else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = scene
        // Creo un navigation controller con CryptoViewController() como
        // controller inicial.
        let mainNavigationController = UINavigationController(rootViewController: CryptoViewController())
        // Designo como controller inicial de la app el navigation controller
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
    }

}


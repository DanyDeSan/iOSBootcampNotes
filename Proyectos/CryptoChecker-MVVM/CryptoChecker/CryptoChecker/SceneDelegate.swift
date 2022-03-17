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
        // Creamos el modulo de CryptoViewModel
        
        // Creamos las dependencias que vamos a inyectar al view model
        let localDataManager: CryptoViewLocalDataManagerProtocol = CryptoViewLocalDataManager()
        let route: Observable<Route> = Observable<Route>(.none)
        let newCryptoCurrency: Observable<Crypto> = Observable<Crypto>(Crypto(name: "", abbreviation: ""))
        let cryptoDataSource: Observable<[Crypto]> = Observable<[Crypto]>([])
        
        // Creamos el view model, inyectando las dependencias que va a usar
        let cryptoViewModel: CryptoViewModelProtocol = CryptoViewModel(localDataManager: localDataManager, route: route, newCryptoCurrency: newCryptoCurrency, cryptoDataSource: cryptoDataSource)
        

        // Creamos el View Controller, inyectando el view model que queremos que use
        let cryptoViewController: CryptoViewController = CryptoViewController()
        cryptoViewController.set(viewModel: cryptoViewModel)
        
        // Creo un navigation controller con CryptoViewController() como
        // controller inicial.
        let mainNavigationController = UINavigationController(rootViewController: cryptoViewController)
        // Designo como controller inicial de la app el navigation controller
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
    }

}


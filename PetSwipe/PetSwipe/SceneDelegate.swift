//
//  SceneDelegate.swift
//  PetSwipe
//
//  Created by George Lee on 5/19/25.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
 // LMAO

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard (scene as? UIWindowScene) != nil else { return }

        NotificationCenter.default.addObserver(self, selector: #selector(handleLoginSuccess), name: .loginSucceeded, object: nil)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    @objc func handleLoginSuccess() {
        print("SceneDelegate: Received loginSucceeded, switching to MainTabBar")

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarVC = storyboard.instantiateViewController(identifier: "MainTabBarController")
        mainTabBarVC.modalPresentationStyle = .fullScreen

        window?.rootViewController = mainTabBarVC
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // this will reset the profile variables everytime the app is built
//    func sceneProfileReset(_ scene: UIScene,
//               willConnectTo session: UISceneSession,
//               options connectionOptions: UIScene.ConnectionOptions) {
//        let keysToRemove = ["savedName", "savedEmail", "savedPhone"]
//        for key in keysToRemove {
//            UserDefaults.standard.removeObject(forKey: key)
//        }
//    }

}


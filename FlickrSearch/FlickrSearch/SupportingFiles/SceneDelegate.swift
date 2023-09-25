import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        self.setWindow(rootViewController: UINavigationController())
    }

    func setWindow(rootViewController: UIViewController?) {
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}


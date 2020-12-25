import Flutter
import UIKit
import HealthProduct

public class SwiftPluginHeathProductPlugin: NSObject, FlutterPlugin {
    
    let transitionDelegate = TransitionDelegate()
    
  public static func register(with registrar: FlutterPluginRegistrar) {

    let channel = FlutterMethodChannel(name: "plugin_heath_product", binaryMessenger: registrar.messenger())

    let instance = SwiftPluginHeathProductPlugin()

    registrar.addMethodCallDelegate(instance, channel: channel)
    registrar.addApplicationDelegate(instance)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    // result("iOS " + UIDevice.current.systemVersion)
    if (call.method == "getPlatformVersion") {
      result("iOS " + UIDevice.current.systemVersion)
    } else if (call.method == "openPage") {
        
        let oldViewController = UIApplication.shared.keyWindow?.rootViewController as? FlutterViewController
        
        let navigationController = UINavigationController(rootViewController: HomeViewController())
//        oldViewController?.present(navigationController, animated: true)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.transitioningDelegate = transitionDelegate
        
        oldViewController?.present(navigationController, animated: true, completion: nil)
        
//        print(oldViewController)
//
//        let homePage = HomeViewController()
//        homePage.oldNavigator = oldViewController
//
//        let navigationController = UINavigationController(rootViewController: homePage)
//        let window = UIApplication.shared.keyWindow
//        window?.rootViewController = navigationController
//        window?.subviews.last?.backgroundColor = .orange

//        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
//            window?.rootViewController = oldViewController
//        }
        
        
        result("iOS " + UIDevice.current.systemVersion)
    }
  }
    
    
    

  
}

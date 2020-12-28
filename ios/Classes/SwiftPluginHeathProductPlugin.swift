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
    if (call.method == "getPlatformVersion") {
      result("iOS " + UIDevice.current.systemVersion)
    } else if (call.method == "openPage") {
        
        let oldViewController = UIApplication.shared.keyWindow?.rootViewController as? FlutterViewController
        
        let navigationController = UINavigationController(rootViewController: PageCtrlll())
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.transitioningDelegate = transitionDelegate
        
        oldViewController?.present(navigationController, animated: true, completion: nil)
                
        result(1)
    }
  }
    
    
    

  
}

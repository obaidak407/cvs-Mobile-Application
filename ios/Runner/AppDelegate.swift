import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.poviderAPIKey("AIzaSyBn8xL5jMHzxNDSRdCYed4NoFvgisBo3tc");
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

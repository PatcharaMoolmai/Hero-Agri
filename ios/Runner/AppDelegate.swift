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

// Google maps API Keys *** REMOVE WHEN APPS API SUCCESSFUL DEV ** MAY CAUSE YOUR MONEY
    GMSServices.provideAPIKey("AIzaSyDhOY4pIdjvqxjucF-mf7ep3C6Pc6d0voI")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

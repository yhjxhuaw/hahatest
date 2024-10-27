//
//  Utilities.swift
//  hahatest
//
//  Created by Xurui Mei on 27/10/24.
//

//import Foundation
//import UIKit
//
//final class Utilities {
//    
//    static let shared = Utilities()
//    private init() { }
//    
//    
//    @MainActor
//    
//    func topViewController(controller: UIViewController? = nil) ->UIViewController? {
//        
//        let controller = controller ?? UIViewController.shared.keyWindow?.rootViewController
//        
//        
//        
//        if let navigationController = controller as? UINavigationController {
//            return topViewController (controller: navigationController.visibleViewController)
//        }
//        if let tabController = controller as? UITabBarController {
//            if let selected = tabController.selectedViewController {
//                return topViewController(controller:selected)
//            }
//        }
//        if let presented = controller?presentedViewContorller {
//            return topViewController(controller: presented)
//        }
//        return controller
//    }
//}
//    
//    
//


import Foundation
import UIKit

final class Utilities {
    
    static let shared = Utilities()
    private init() { }
    
    @MainActor
    func topViewController(controller: UIViewController? = nil) -> UIViewController? {
        
        // Access the root view controller from UIApplication
        let controller = controller ?? UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController
        
        // Check for UINavigationController and get the visible view controller
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        
        // Check for UITabBarController and get the selected view controller
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        
        // Recursively check for presented view controllers
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        
        return controller
    }
}

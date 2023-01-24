//
//  NavigationUtil.swift
//  CalculadoraUIkit
//
//  Created by Marcelo de Araújo  on 18/12/2022
//

import SwiftUI

struct NavigationUtil {
    static func popToRootView() {
        self.root()?.popToRootViewController(animated: true)
    }
    
    static func showAlert(title:String, msg:String, button:String)  {
        self.top()?.showAlert(title: title, msg: msg, button:button)
    }
    
    static func root() -> UINavigationController? {
        return findNavigationController(viewController: UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController)
    }
    
    static func top() -> UIViewController? {
        return UIApplication.shared.windows.first?.rootViewController
    }
    
    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
        
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        
        return nil
    }
}

// https://stackoverflow.com/questions/57334455/swiftui-how-to-pop-to-root-view

extension UIViewController {
    
    @objc func showAlert(title:String, msg:String, button:String) {
        let alertTitle = title
        let alertMessage = msg
        
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let notNowButton = UIAlertAction(title: button, style: .default)
        alertController.addAction(notNowButton)
        self.present(alertController, animated: true, completion: nil)
    }
}

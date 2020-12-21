//
//  ViewController.swift
//  AndersenDroneApp
//
//  Created by Andrey Chub on 20.12.2020.
//

import UIKit
import DJISDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DJISDKManager.registerApp(with: self)
    }

    func showRegistrationAlert(_ success: Bool) {

        let message = success ? "App Resisteres Success!" : "Register App Failed!"
        let alertController = UIAlertController(title: "Register App",
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { [weak self] action in
                self?.navigateToDefaultLayoutViewController()
            })

        alertController.addAction(okAction)

        navigationController?.present(alertController,
                                      animated: true,
                                      completion: nil)
    }

    private func navigateToDefaultLayoutViewController() {
        let storyboard = UIStoryboard.init(name: "DefaultLayoutViewController", bundle: Bundle.main)
        guard let vc = storyboard.instantiateViewController(
                withIdentifier: "DefaultLayoutViewController") as? DefaultLayoutViewController else {
            return
        }

        navigationController?.present(vc,
                                      animated: true,
                                      completion: nil)
    }
}

extension ViewController: DJISDKManagerDelegate {
    public func appRegisteredWithError(_ error: Error?) {
        
        let isRegisteresSuccess = error == nil
        showRegistrationAlert(isRegisteresSuccess)
    }

    public func didUpdateDatabaseDownloadProgress(_ progress: Progress) {
        // Not use
    }
}

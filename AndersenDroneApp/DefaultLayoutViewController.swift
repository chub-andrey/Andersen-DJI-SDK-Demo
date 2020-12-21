//
//  DefaultLayoutViewController.swift
//  AndersenDroneApp
//
//  Created by Andrey Chub on 20.12.2020.
//

import UIKit
import DJIUXSDK
import AVFoundation

class DefaultLayoutViewController: DUXDefaultLayoutViewController {

    // MARK: - Properties

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent;
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions

    @IBAction func close () {
        dismiss(animated: true, completion: nil)
    }
}

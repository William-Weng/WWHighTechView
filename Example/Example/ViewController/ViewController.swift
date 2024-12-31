//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/12/31.
//

import UIKit
import WWHighTechView

// MARK: - ViewController
final class ViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var myHighTechTextView: WWHighTechView!
        
    @IBAction func test(_ sender: UIBarButtonItem) {
        myHighTechTextView.start(innerView: testLabel)
    }
}



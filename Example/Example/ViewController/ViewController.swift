//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2024/12/31.
//

import UIKit
import WWPrint
import WWHighTechView

// MARK: - ViewController
final class ViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var myHighTechTextView: WWHighTechView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myHighTechTextView.delegate = self
    }
    
    @IBAction func test(_ sender: UIBarButtonItem) {
        myHighTechTextView.start(innerView: testLabel)
    }
}

// MARK: - WWHighTechViewDelegate
extension ViewController: WWHighTechViewDelegate {
    
    func highTechView(_ highTechView: WWHighTechView, status: WWHighTechView.Status) {
        wwPrint(status)
    }
}

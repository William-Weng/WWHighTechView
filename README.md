# WWHighTechView

[![Swift-5.6](https://img.shields.io/badge/Swift-5.6-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-14.0](https://img.shields.io/badge/iOS-14.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![](https://img.shields.io/github/v/tag/William-Weng/WWHighTechView) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

### [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- [Imitation of a high-tech View.](https://588ku.com/video/27048571.html)
- [仿造一個有高科技感的View。](https://chillcomponent.codlin.me/components/card-futuristic/)

![WWHighTechView](./Example.webp)

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)
```bash
dependencies: [
    .package(url: "https://github.com/William-Weng/WWHighTechView.git", .upToNextMajor(from: "1.1.0"))
]
```

### [可用函式 - Function](https://ezgif.com/video-to-webp)
|函式|說明|
|-|-|
|start(duration:innerView:repeatFlashCount:highTechColor:)|啟動動畫功能|
|ready(duration:highTechColor:)|等待中 (一直閃爍)|
|reset()|回復初始狀態|

### [WWHighTechViewDelegate](https://ezgif.com/video-to-webp)
|函式|說明|
|-|-|
|highTechView(_:status:)|HighTechView的動畫狀態|

### Example
```swift
import UIKit
import WWPrint
import WWHighTechView

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

extension ViewController: WWHighTechViewDelegate {
    
    func highTechView(_ highTechView: WWHighTechView, status: WWHighTechView.Status) {
        wwPrint(status)
    }
}
```

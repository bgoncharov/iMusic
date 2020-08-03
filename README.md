# iMusic

Music application that uses iTunes Search API. Almost like Apple Music. Made with Clean Swift(VIP) architecture.

**Stack:** iTunes Search API, UIKit, SwiftUI, AVKit, URLImage, SDWebImage, Clean Swift(VIP).

![Demo](https://github.com/bgoncharov/iMusic/blob/master/img/demo1.gif)
![Demo](https://github.com/bgoncharov/iMusic/blob/master/img/demo2.gif)

## Сontents

- [Setup application in code](https://github.com/bgoncharov/iMusic#setup-application-in-code)
- [Player using AVKit](https://github.com/bgoncharov/iMusic#trackdetailview-file)
  - [How gestures are working](https://github.com/bgoncharov/iMusic#trackdetailview-file)
  - [Working with animation](https://github.com/bgoncharov/iMusic#animation)
  - [Images and SDWebImage Library](https://github.com/bgoncharov/iMusic#images-and-sdwebimage-library)

## Setup application in code

### SceneDelegate file

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = MainTabBarController()
    }
```
### MainTabBarController file

```swift
override func viewDidLoad() {
        super.viewDidLoad()
        
        searchVC.tabBardelegate = self
        
        var library = Library()
        library.tabBarDelegate = self
        let hostVC = UIHostingController(rootView: library)
        hostVC.tabBarItem.image = #imageLiteral(resourceName: "library")
        hostVC.tabBarItem.title = "Library"

        viewControllers = [
            hostVC, 
            generateViewController(rootViewController: searchVC, image: "magnifyingglass", title: "Search")
        ]
    }
 ```
 
### UIKit and SwiftUI

There are two main screens: `Search` and `Library`. Search screen made with `UIKit`, and Library made with `SwiftUI`. To make work them together in `func viewDidLoad()` of `MainTabBarController` (which is main controller for both views) I used `UIHostingController()`.

```swift
var library = Library()
library.tabBarDelegate = self
let hostVC = UIHostingController(rootView: library)
```

## Player

### TrackDetailView file

Track player made with `AVKit`

```swift
let player: AVPlayer = {
        let avPlayer = AVPlayer()
        avPlayer.automaticallyWaitsToMinimizeStalling = false
        return avPlayer
 }()
```

`func awakeFromNib()` anstead of `func viewDidLoad()`, because `TrackDetailView` representation made with xib file.

```swift
override func awakeFromNib() {
        super.awakeFromNib()
}
```

### Gestures

```swift
private func setupGestures() {
        
        miniTrackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapMaximized)))
        miniTrackView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismissalPan)))
 }
```

### Animation

If you press play or pause you'll see that track image changes size with animation.

```swift
private func enlargeTrackImageView() {
    UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
       self.trackImageView.transform = .identity
     }, completion: nil)
}
    
private func reduceTrackImageView() {
   UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
     let scale: CGFloat = 0.8
     self.trackImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }, completion: nil)
}
 ```
 
 ### Images and SDWebImage Library
 
 [SDWebImage](https://github.com/SDWebImage/SDWebImage) provides an async image downloader with cache support. 

 ```swift
 miniTrackImageView.sd_setImage(with: url, completed: nil)
 trackImageView.sd_setImage(with: url, completed: nil)
 ```

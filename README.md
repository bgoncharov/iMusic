# iMusic

Music application that uses iTunes Search API. Almost like Apple Music. Made with Clean Swift(VIP) architecture.

**Stack:** iTunes Search API, UIKit, SwiftUI, AVKit, URLImage, SDWebImage, Clean Swift(VIP).

![Demo](https://github.com/bgoncharov/iMusic/blob/master/img/demo1.gif)
![Demo](https://github.com/bgoncharov/iMusic/blob/master/img/demo2.gif)

## Setup application in code

### AppDelegate file

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.makeKeyAndVisible()
        window?.rootViewController = MainTabBarController()
    }
```

## About

There are two main screens: `Search` and `Library`. Search screen made with `UIKit`, and Library made with `SwiftUI`. To make work them together in `func viewDidLoad()` of `MainTabBarController` (which is main controller for both views) I used `UIHostingController()`.

```swift
var library = Library()
library.tabBarDelegate = self
let hostVC = UIHostingController(rootView: library)
```

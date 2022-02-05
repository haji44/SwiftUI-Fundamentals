//
//  Framework.swift
//  Apple-FrameWork
//
//  Created by kitano hajime on 2022/02/05.
//

import Foundation

// This struct used as a model of data to be showed for user
struct Framework: Hashable, Identifiable {
    var id = UUID() // this property used as id
    let name: String
    let imageName: String // Image name stored in assets folder
    let urlString: String
    let description: String
}

struct MockData {
    
    static let sampleFramework = Framework(id: <#T##UUID#>, name: <#T##String#>, imageName: <#T##String#>, urlString: <#T##String#>, description: <#T##String#>)
    
    static let sampleFramework = Framework(name: "ARKit",
                                           imageName: "arkit",
                                           urlString: "https://developer.apple.com/augmented-reality/arkit",
                                           description: "ARKit 4 introduces a brand-new Depth API, creating a new way to access the detailed depth information gathered by the LiDAR Scanner on iPhone 12 Pro, iPhone 12 Pro Max, and iPad Pro.\n\nLocation Anchors leverages the higher-resolution data in Apple Maps to place AR experiences at a specific point in the world in your iPhone and iPad apps. And support for face tracking extends to all devices with the Apple Neural Engine and a front-facing camera, so even more users can experience the joy of AR in photos and videos.")
    
    static let frameworks = [
        Framework(name: "App Clips",
                  imageName: "app-clip",
                  urlString: "https://developer.apple.com/app-clips",
                  description: "App Clips are a great way for users to quickly access and experience what your app has to offer. An App Clip is a small part of your app that’s discoverable at the moment it’s needed. App Clips are fast and lightweight so a user can open them quickly.\n\nWhether they're ordering take-out from a restaurant, renting a scooter, or setting up a new connected appliance for the first time, users will be able to start and finish an experience from your app in seconds. And when they’re done, you can offer the opportunity to download your full app from the App Store."),
        
        Framework(name: "ARKit",
                  imageName: "arkit",
                  urlString: "https://developer.apple.com/augmented-reality/arkit",
                  description: "ARKit 4 introduces a brand-new Depth API, creating a new way to access the detailed depth information gathered by the LiDAR Scanner on iPhone 12 Pro, iPhone 12 Pro Max, and iPad Pro.\n\nLocation Anchors leverages the higher-resolution data in Apple Maps to place AR experiences at a specific point in the world in your iPhone and iPad apps. And support for face tracking extends to all devices with the Apple Neural Engine and a front-facing camera, so even more users can experience the joy of AR in photos and videos."),
        
        Framework(name: "CarPlay",
                  imageName: "carplay",
                  urlString: "https://developer.apple.com/carplay",
                  description: "A smarter, safer way to use your iPhone in the car, CarPlay takes the things you want to do with your iPhone while driving and puts them on your car’s built-in display.\n\nYou can get directions, make calls, send and receive messages, and listen to music, all while staying focused on the road."),
        
        Framework(name: "Catalyst",
                  imageName: "catalyst",
                  urlString: "https://developer.apple.com/mac-catalyst",
                  description: "Native Mac apps built with Mac Catalyst can share code with your iPad apps, and you can add more features just for Mac. In macOS Big Sur, you can create even more powerful versions of your apps and take advantage of every pixel on the screen by running them at native Mac resolution.\n\nApps built with Mac Catalyst can now be fully controlled using just the keyboard, access more iOS frameworks, and take advantage of the all-new look of macOS Big Sur. There’s never been a better time to turn your iPad app into a powerful Mac app."),

        Framework(name: "ClassKit",
                  imageName: "classkit",
                  urlString: "https://developer.apple.com/classkit",
                  description: "The many great learning apps available in the App Store are an integral part of the teaching and learning experience in schools. By adopting ClassKit, your app will work with Schoolwork, a powerful iPad app for teachers and students to help keep track of assignments and student progress.\n\nYou can help teachers discover assignable activities in your app, take students directly to the right activity with a single tap, and securely and privately share progress data with teachers to help them personalize instruction."),
        
        Framework(name: "CloudKit",
                  imageName: "cloudkit",
                  urlString: "https://developer.apple.com/icloud/cloudkit",
                  description: "Store your app’s data in iCloud and keep everything up to date across apps and on the web with CloudKit JS. With up to 1PB of free storage for each app, it’s never been easier to build and grow your apps using CloudKit."),
        
        Framework(name: "Core ML",
                  imageName: "coreml",
                  urlString: "https://developer.apple.com/machine-learning",
                  description: "Create intelligent features and enable new experiences for your apps by leveraging powerful on-device machine learning.\n\nLearn how to build, train, and deploy machine learning models into your iPhone, iPad, Apple Watch, and Mac apps."),
        
        Framework(name: "HealthKit",
                  imageName: "healthkit",
                  urlString: "https://developer.apple.com/health-fitness",
                  description: "Integrate HealthKit into your health and fitness apps for iOS and watchOS to create a more seamless user experience.\n\nWhen a customer provides permission for your app to read and write health and activity data to their Health app, your app becomes a valuable data source and can deliver deeply informed health and fitness solutions."),
        
        Framework(name: "Metal",
                  imageName: "metal",
                  urlString: "https://developer.apple.com/metal",
                  description: "Metal provides near-direct access to the graphics processing unit (GPU), enabling you to maximize the graphics and compute potential of your apps on iOS, macOS, and tvOS.\n\nBuilding on an approachable, low-overhead architecture with precompiled GPU shaders, fine-grained resource control, and multithreading support, Metal further evolves support for GPU-driven command creation, simplifies working with the array of Metal-capable GPUs, and lets you tap into Pro power of Mac Pro and Pro Display XDR."),
        
        Framework(name: "SF Symbols",
                  imageName: "sf-symbols",
                  urlString: "https://developer.apple.com/sf-symbols",
                  description: "With over 2,400 configurable symbols, SF Symbols is designed to integrate seamlessly with San Francisco, the system font for Apple platforms. Each symbol comes in a wide range of weights and scales that automatically align with text labels, and supports Dynamic Type and the Bold Text accessibility feature.\n\nYou can also export symbols and edit them in vector graphics editing tools to create custom symbols with shared design characteristics and accessibility features."),
        
        Framework(name: "SiriKit",
                  imageName: "sirikit",
                  urlString: "https://developer.apple.com/siri",
                  description: "Siri is the world’s most popular intelligent assistant, and now has an all new compact design. With SiriKit and Shortcuts, your apps can help users get things done with just their voice, intelligent suggestions, or the Shortcuts app.\n\nYour apps can now also integrate with more platforms with Shortcuts on watchOS 7, SiriKit Music on HomePod, and SiriKit Media on Apple TV."),
        
        Framework(name: "SpriteKit",
                  imageName: "spritekit",
                  urlString: "https://developer.apple.com/spritekit",
                  description: "The SpriteKit framework makes it easy to create high-performance, battery-efficient 2D games.\n\nWith support for custom OpenGL ES shaders and lighting, integration with SceneKit, and advanced new physics effects and animations, you can add force fields, detect collisions, and generate new lighting effects in your games."),
        
        Framework(name: "SwiftUI",
                  imageName: "swiftui",
                  urlString: "https://developer.apple.com/xcode/swiftui",
                  description: "SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs.\n\nWith a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written."),
        
        Framework(name: "Test Flight",
                  imageName: "test-flight",
                  urlString: "https://developer.apple.com/testflight",
                  description: "TestFlight makes it easy to invite users to test your apps and app clip experiences and collect valuable feedback before releasing your apps on the App Store.\n\nYou can invite up to 10,000 testers using just their email address or by sharing a public link."),
        
        Framework(name: "Wallet",
                  imageName: "wallet",
                  urlString: "https://developer.apple.com/wallet/get-started",
                  description: "The Wallet app on iPhone, iPod touch, and Apple Watch allows users to easily manage payment cards, boarding passes, tickets, gift cards, and other passes.\n\nWallet is time and location enabled, so passes can be configured to display on the user’s device at the appropriate moment, like when the user reaches the airport or walks into a store.\n\nPasses can also be updated with push notifications so, if details change, you can notify the user and they can simply tap the notification to view the updated pass."),
        
        Framework(name: "WidgetKit",
                  imageName: "widgetkit",
                  urlString: "https://developer.apple.com/widgets",
                  description: "Easily build widgets and make them available across iOS, iPadOS, and macOS using the WidgetKit framework and the new widget API for SwiftUI. Widgets now come in multiple sizes, and users can visit the new widget gallery to search, preview sizes, and place them anywhere on the Home screen to access important details at a glance.\n\nThey can also add Smart Stacks — sets of widgets that use on-device intelligence to surface the right widget at the right moment, based on factors like time, location, and activity.")
    ]
}

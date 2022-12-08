# Overview
This is a simple delivery order filtering app. The app filter and sort available delivery dates based on the product in customer cart.

# Technologies and Architecture 
The app's functionality is pretty simple, so the MVVM architecture implemented is straightforward, and the viewmodels contain no complex logic. There is two service class, one to handle filtering and one to handle the sorting. Other than that, SwiftUI and Swift is used for writing the application, and no third-party libraries were used.

The app architecture strictly tried to follow Single responsiblity, open closed, protocol oriented programming principle. The access control also specified and discarded any use of magic numbers or strings.

Although force unwrapping is dicouraged, the app contains few of them with catuions for simplicity. This can easily be handled if needed.

# Reading materials
Understanding Date and DateComponents
https://medium.com/geekculture/swift-work-with-dates-2-create-parse-and-format-dates-fbb62ddd330f

https://sarunw.com/posts/understanding-date-and-datecomponents/

Sorting by multiple properties
https://medium.com/macoclock/how-to-sort-by-multiple-properties-in-swift-5e08b1ef1f23

# How to run
Open the project with latest Xcode version and tap the run button selecting an emulator or actual device.

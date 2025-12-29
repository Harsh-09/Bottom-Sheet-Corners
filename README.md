# BottomSheetCorners

A lightweight Swift Package that provides device-specific corner radius values for iOS bottom sheet components. Returns appropriate corner radius values based on the current device model and the bottom sheet's presentation state.

## Features

- ✅ Device-specific corner radius values for all iPhone models (iPhone 11 through iPhone 17)
- ✅ Supports collapsed and expanded sheet states
- ✅ Works with both SwiftUI and UIKit
- ✅ 100% App Store safe (no private APIs)
- ✅ Lightweight and easy to use

## Installation

### Swift Package Manager

Add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/[your-org]/BottomSheetCorners.git", from: "1.0.0")
]
```

Or add it in Xcode:
1. File → Add Package Dependencies
2. Enter the repository URL
3. Select version rule
4. Add to target

## Requirements

- iOS 14.0+
- Swift 5.7+
- Xcode 14.0+

## Usage

### Basic Usage

```swift
import BottomSheetCorners

// Get radius for collapsed state
let collapsedRadius = BottomSheetCorners.radius(for: .collapsed)

// Get radius for expanded state
let expandedRadius = BottomSheetCorners.radius(for: .expanded)

// Get both at once
let (collapsed, expanded) = BottomSheetCorners.allRadii()
```

### UIKit Usage

```swift
import UIKit
import BottomSheetCorners

class BottomSheetViewController: UIViewController {
    
    private let sheetView = UIView()
    private var isCollapsed = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCornerRadius()
    }
    
    func updateCornerRadius() {
        let state: SheetState = isCollapsed ? .collapsed : .expanded
        let radius = UIScreen.main.bottomSheetCornerRadius(for: state)
        
        sheetView.layer.cornerRadius = radius
        sheetView.layer.cornerCurve = .continuous
        sheetView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func expandSheet() {
        isCollapsed = false
        UIView.animate(withDuration: 0.3) {
            self.updateCornerRadius()
        }
    }
}
```

### SwiftUI Usage

```swift
import SwiftUI
import BottomSheetCorners

struct ContentView: View {
    @State private var sheetState: SheetState = .collapsed
    
    var body: some View {
        ZStack {
            // Background
            Color.gray.opacity(0.3)
            
            // Bottom Sheet
            VStack {
                Spacer()
                
                SheetContent()
                    .frame(height: sheetState == .collapsed ? 100 : 400)
                    .bottomSheetCornerRadius(sheetState, corners: [.topLeft, .topRight])
                    .animation(.spring(), value: sheetState)
            }
        }
        .onTapGesture {
            sheetState = sheetState == .collapsed ? .expanded : .collapsed
        }
    }
}
```

### With Native Sheet Presentation

```swift
import SwiftUI
import BottomSheetCorners

struct MainView: View {
    @State private var selectedDetent: PresentationDetent = .medium
    
    var currentState: SheetState {
        selectedDetent == .height(100) ? .collapsed : .expanded
    }
    
    var body: some View {
        Color.clear
            .sheet(isPresented: .constant(true)) {
                SheetContent()
                    .presentationDetents([.height(100), .medium, .large], selection: $selectedDetent)
                    .presentationCornerRadius(BottomSheetCorners.radius(for: currentState))
            }
    }
}
```

## API Reference

### SheetState

```swift
public enum SheetState {
    case collapsed  // Minimum sheet height (peek state)
    case expanded   // Partial or full sheet height
}
```

### BottomSheetCorners

```swift
public struct BottomSheetCorners {
    /// Returns the appropriate corner radius for the given sheet state
    public static func radius(for state: SheetState) -> CGFloat
    
    /// Returns both corner radius values as a tuple
    public static func allRadii() -> (collapsed: CGFloat, expanded: CGFloat)
}
```

### UIScreen Extension

```swift
extension UIScreen {
    /// Returns the bottom sheet corner radius for the given state
    public func bottomSheetCornerRadius(for state: SheetState) -> CGFloat
}
```

### View Extension

```swift
extension View {
    /// Applies device-appropriate corner radius for bottom sheet
    public func bottomSheetCornerRadius(_ state: SheetState) -> some View
    
    /// Applies device-appropriate corner radius to specific corners (iOS 15.0+)
    @available(iOS 15.0, *)
    public func bottomSheetCornerRadius(
        _ state: SheetState,
        corners: UIRectCorner
    ) -> some View
}
```

## Device Support

The package supports all iPhone models from iPhone 11 through iPhone 17 series, with device-specific corner radius values for both collapsed and expanded states.

| Device Series | Collapsed | Expanded |
|---------------|-----------|----------|
| iPhone 11 series | 28pt | 36pt |
| iPhone 12/13 mini | 28pt | 36pt |
| iPhone 12/13/14 | 32pt | 40pt |
| iPhone 12/13 Pro Max, 14 Plus | 40pt | 48pt |
| iPhone 14 Pro, 15 series, 16 | 40pt | 48pt |
| iPhone 15 Plus, 16 Plus | 40pt | 48pt |
| iPhone 16 Pro/Pro Max | 48pt | 56pt |
| iPhone 16e | 32pt | 40pt |
| iPhone 17 series | 48pt | 56pt |
| Unknown (fallback) | 28pt | 36pt |

## How It Works

The package identifies devices using `UIScreen.main.nativeBounds` (screen resolution), which is a safe, public API. Devices are mapped to categories based on their resolution, and the appropriate corner radius values are returned for each state.

## License

MIT License


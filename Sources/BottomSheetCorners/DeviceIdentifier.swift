import UIKit

/// Identifies the current device based on screen resolution
internal struct DeviceIdentifier {
    
    /// Device categories based on corner radius groupings
    enum DeviceCategory {
        case iPhone11Series          // 11, 11 Pro, 11 Pro Max
        case iPhone12Mini13Mini      // 12 mini, 13 mini
        case iPhone12_13_14Base      // 12, 12 Pro, 13, 13 Pro, 14
        case iPhone12ProMax13ProMax14Plus  // 12 Pro Max, 13 Pro Max, 14 Plus
        case iPhone14Pro15_16Base    // 14 Pro, 15, 15 Pro, 16
        case iPhone14ProMax15Plus16Plus  // 14 Pro Max, 15 Plus, 15 Pro Max, 16 Plus
        case iPhone16Pro             // 16 Pro
        case iPhone16ProMax          // 16 Pro Max
        case iPhone16e               // 16e
        case iPhone17Series          // 17, 17 Air, 17 Pro, 17 Pro Max
        case unknown                 // Fallback
    }
    
    /// Returns the device category based on screen resolution
    static func currentCategory() -> DeviceCategory {
        let screen = UIScreen.main
        let nativeBounds = screen.nativeBounds
        let width = Int(nativeBounds.width)
        let height = Int(nativeBounds.height)
        let scale = screen.scale
        let iosVersion = ProcessInfo.processInfo.operatingSystemVersion
        
        // Check for iPhone 17 Air first (before switch to prioritize detection)
        // iPhone 17 Air uses unique resolution 1260 x 2736
        if (width == 1260 && height == 2736) || (width == 2736 && height == 1260) {
            #if DEBUG
            print("✅ iPhone 17 Air detected: \(width) x \(height)")
            #endif
            return .iPhone17Series
        }
        
        switch (width, height) {
        // iPhone 11 Series
        case (828, 1792):   return .iPhone11Series           // iPhone 11, XR
        case (1125, 2436):  return .iPhone11Series           // iPhone 11 Pro, X, XS
        case (1242, 2688):  return .iPhone11Series           // iPhone 11 Pro Max, XS Max
            
        // iPhone 12 mini, 13 mini
        case (1080, 2340):  return .iPhone12Mini13Mini
            
        // iPhone 12, 12 Pro, 13, 13 Pro, 14
        case (1170, 2532):  return .iPhone12_13_14Base
            
        // iPhone 12 Pro Max, 13 Pro Max, 14 Plus
        case (1284, 2778):  return .iPhone12ProMax13ProMax14Plus
            
        // iPhone 14 Pro, 15, 15 Pro, 16
        case (1179, 2556):  return .iPhone14Pro15_16Base
            
        // iPhone 14 Pro Max, 15 Plus, 15 Pro Max, 16 Plus
        case (1290, 2796):  return .iPhone14ProMax15Plus16Plus
            
        // iPhone 16 Pro
        case (1206, 2622):  return .iPhone16Pro
            
        // iPhone 16 Pro Max
        case (1320, 2868):  return .iPhone16ProMax
            
        // iPhone 17 series (17, 17 Air, 17 Pro, 17 Pro Max)
        // Note: iPhone 17 Air (1260x2736) is handled above before the switch statement
        // Add other iPhone 17 series resolutions here when available
            
        // TODO: Add iPhone 16e resolution when available
        // case (TBD, TBD): return .iPhone16e
            
        default:
            // Debug: Print unknown device resolution to help identify new devices
            #if DEBUG
            print("⚠️ Unknown device resolution: \(width) x \(height), scale: \(scale), iOS: \(iosVersion.majorVersion).\(iosVersion.minorVersion) - Please add this case to DeviceIdentifier")
            #endif
            return .unknown
        }
    }
}


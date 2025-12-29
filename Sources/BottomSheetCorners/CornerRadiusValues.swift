import UIKit

/// Contains all hardcoded corner radius values for each device category
internal struct CornerRadiusValues {
    
    /// Returns corner radius for collapsed state
    static func collapsed(for category: DeviceIdentifier.DeviceCategory) -> CGFloat {
        switch category {
        case .iPhone11Series:
            return 28
            
        case .iPhone12Mini13Mini:
            return 28
            
        case .iPhone12_13_14Base:
            return 32
            
        case .iPhone12ProMax13ProMax14Plus:
            return 40
            
        case .iPhone14Pro15_16Base:
            return 40
            
        case .iPhone14ProMax15Plus16Plus:
            return 40
            
        case .iPhone16Pro:
            return 48
            
        case .iPhone16ProMax:
            return 48
            
        case .iPhone16e:
            return 32
            
        case .iPhone17Series:
            return 48
            
        case .unknown:
            return 28  // Fallback to iPhone 11 values
        }
    }
    
    /// Returns corner radius for expanded state (also used for partial)
    static func expanded(for category: DeviceIdentifier.DeviceCategory) -> CGFloat {
        switch category {
        case .iPhone11Series:
            return 36
            
        case .iPhone12Mini13Mini:
            return 36
            
        case .iPhone12_13_14Base:
            return 40
            
        case .iPhone12ProMax13ProMax14Plus:
            return 48
            
        case .iPhone14Pro15_16Base:
            return 48
            
        case .iPhone14ProMax15Plus16Plus:
            return 48
            
        case .iPhone16Pro:
            return 56
            
        case .iPhone16ProMax:
            return 56
            
        case .iPhone16e:
            return 40
            
        case .iPhone17Series:
            return 56
            
        case .unknown:
            return 36  // Fallback to iPhone 11 values
        }
    }
}


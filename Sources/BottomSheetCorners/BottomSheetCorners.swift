import UIKit

/// Main interface for retrieving device-specific bottom sheet corner radius values
public struct BottomSheetCorners {
    
    /// Private initializer - use static methods only
    private init() {}
    
    /// Returns the appropriate corner radius for the current device and sheet state
    ///
    /// - Parameter state: The presentation state of the bottom sheet
    /// - Returns: Corner radius value in points
    ///
    /// Example:
    /// ```swift
    /// let collapsed = BottomSheetCorners.radius(for: .collapsed)
    /// let expanded = BottomSheetCorners.radius(for: .expanded)
    /// ```
    public static func radius(for state: SheetState) -> CGFloat {
        let category = DeviceIdentifier.currentCategory()
        
        switch state {
        case .collapsed:
            return CornerRadiusValues.collapsed(for: category)
        case .expanded:
            return CornerRadiusValues.expanded(for: category)
        }
    }
    
    /// Returns both corner radius values as a tuple
    ///
    /// - Returns: Tuple containing (collapsed, expanded) radius values
    ///
    /// Example:
    /// ```swift
    /// let (collapsed, expanded) = BottomSheetCorners.allRadii()
    /// ```
    public static func allRadii() -> (collapsed: CGFloat, expanded: CGFloat) {
        let category = DeviceIdentifier.currentCategory()
        return (
            collapsed: CornerRadiusValues.collapsed(for: category),
            expanded: CornerRadiusValues.expanded(for: category)
        )
    }
}


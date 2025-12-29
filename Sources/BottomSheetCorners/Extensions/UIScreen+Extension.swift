import UIKit

extension UIScreen {
    
    /// Returns the bottom sheet corner radius for the given state
    ///
    /// - Parameter state: The presentation state of the bottom sheet
    /// - Returns: Corner radius value in points
    ///
    /// Example:
    /// ```swift
    /// let radius = UIScreen.main.bottomSheetCornerRadius(for: .collapsed)
    /// ```
    public func bottomSheetCornerRadius(for state: SheetState) -> CGFloat {
        return BottomSheetCorners.radius(for: state)
    }
}


import SwiftUI
import UIKit

extension View {
    
    /// Applies device-appropriate corner radius for bottom sheet
    ///
    /// - Parameter state: The presentation state of the bottom sheet
    /// - Returns: Modified view with corner radius applied
    ///
    /// Example:
    /// ```swift
    /// SheetContent()
    ///     .bottomSheetCornerRadius(.collapsed)
    /// ```
    public func bottomSheetCornerRadius(_ state: SheetState) -> some View {
        let radius = BottomSheetCorners.radius(for: state)
        return self.clipShape(
            RoundedRectangle(cornerRadius: radius, style: .continuous)
        )
    }
    
    /// Applies device-appropriate corner radius to specific corners
    ///
    /// - Parameters:
    ///   - state: The presentation state of the bottom sheet
    ///   - corners: Which corners to round (default: top corners only)
    /// - Returns: Modified view with corner radius applied
    ///
    /// Example:
    /// ```swift
    /// SheetContent()
    ///     .bottomSheetCornerRadius(.expanded, corners: [.topLeft, .topRight])
    /// ```
    @available(iOS 16.0, *)
    public func bottomSheetCornerRadius(
        _ state: SheetState,
        corners: UIRectCorner
    ) -> some View {
        let radius = BottomSheetCorners.radius(for: state)
        return self.clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: corners.contains(.topLeft) ? radius : 0,
                bottomLeadingRadius: corners.contains(.bottomLeft) ? radius : 0,
                bottomTrailingRadius: corners.contains(.bottomRight) ? radius : 0,
                topTrailingRadius: corners.contains(.topRight) ? radius : 0,
                style: .continuous
            )
        )
    }
}


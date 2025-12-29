import Foundation

/// Represents the presentation state of a bottom sheet
/// that affects which corner radius value should be used
public enum SheetState {
    /// Collapsed/minimized state
    /// Sheet is at minimum height, showing only essential controls
    case collapsed
    
    /// Expanded state (includes partial expansion)
    /// Sheet is at default or maximum height
    case expanded
}


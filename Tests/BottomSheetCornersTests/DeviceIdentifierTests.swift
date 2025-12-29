import XCTest
@testable import BottomSheetCorners

final class CornerRadiusValuesTests: XCTestCase {
    
    func testIPhone11CollapsedValues() {
        let radius = CornerRadiusValues.collapsed(for: .iPhone11Series)
        XCTAssertEqual(radius, 28)
    }
    
    func testIPhone11ExpandedValues() {
        let radius = CornerRadiusValues.expanded(for: .iPhone11Series)
        XCTAssertEqual(radius, 36)
    }
    
    func testIPhone16ProCollapsedValues() {
        let radius = CornerRadiusValues.collapsed(for: .iPhone16Pro)
        XCTAssertEqual(radius, 48)
    }
    
    func testIPhone16ProExpandedValues() {
        let radius = CornerRadiusValues.expanded(for: .iPhone16Pro)
        XCTAssertEqual(radius, 56)
    }
    
    func testUnknownDeviceFallback() {
        let collapsed = CornerRadiusValues.collapsed(for: .unknown)
        let expanded = CornerRadiusValues.expanded(for: .unknown)
        XCTAssertEqual(collapsed, 28)  // iPhone 11 fallback
        XCTAssertEqual(expanded, 36)   // iPhone 11 fallback
    }
}


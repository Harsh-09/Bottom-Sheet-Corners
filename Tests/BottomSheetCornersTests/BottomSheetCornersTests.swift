import XCTest
@testable import BottomSheetCorners

final class BottomSheetCornersTests: XCTestCase {
    
    func testCollapsedRadiusReturnsValue() {
        let radius = BottomSheetCorners.radius(for: .collapsed)
        XCTAssertGreaterThan(radius, 0)
    }
    
    func testExpandedRadiusReturnsValue() {
        let radius = BottomSheetCorners.radius(for: .expanded)
        XCTAssertGreaterThan(radius, 0)
    }
    
    func testExpandedRadiusGreaterThanCollapsed() {
        let collapsed = BottomSheetCorners.radius(for: .collapsed)
        let expanded = BottomSheetCorners.radius(for: .expanded)
        XCTAssertGreaterThan(expanded, collapsed)
    }
    
    func testAllRadiiReturnsBothValues() {
        let (collapsed, expanded) = BottomSheetCorners.allRadii()
        XCTAssertGreaterThan(collapsed, 0)
        XCTAssertGreaterThan(expanded, 0)
        XCTAssertGreaterThan(expanded, collapsed)
    }
}


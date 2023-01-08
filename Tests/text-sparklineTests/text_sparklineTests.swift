import XCTest
@testable import text_sparkline

final class text_sparklineTests: XCTestCase {
    func testEmpty() throws {
        XCTAssertEqual(text_sparkline().generate([]), "")
    }
    func testEqual() throws {
        XCTAssertEqual(text_sparkline().generate([1,1,1,1,1]), "▁▁▁▁▁")
    }
    func testRegular() throws {
        XCTAssertEqual(text_sparkline().generate([67, 71, 77, 85, 95, 104, 106, 105, 100, 89, 76, 66]), "▁▂▃▄▆███▇▅▃▁")
    }
    func testValley() throws {
        XCTAssertEqual(text_sparkline().generate([1.1, 0.1, 0.1, 1.1]), "█▁▁█")
    }
}

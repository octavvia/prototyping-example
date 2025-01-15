import XCTest

class PopularMoviesViewUITests: XCTestCase {
    func testPopularMoviesView_DisplaysMovies() {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertTrue(app.navigationBars["Popular Movies"].exists)
    }
}

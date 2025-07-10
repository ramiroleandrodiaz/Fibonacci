//
//  FibonacciUITests.swift
//  FibonacciUITests
//
//  Created by Ramiro Diaz on 09/07/2025.
//

import XCTest

final class FibonacciUITests: XCTestCase {

  func testInitialLoad() {
    let app = XCUIApplication()
    app.launch()
    
    let title = app.staticTexts["Fibonacci Calculator"]
    let textfield = app.textFields.firstMatch
    let textfieldsCount = app.textFields.count
    
    let headerText = app.staticTexts["Fibonacci Sequence"]
    let leftColumnText = app.staticTexts["N"]
    let rightColumnText = app.staticTexts["F(N)"]
    
    XCTAssertTrue(title.exists)
    XCTAssertTrue(textfield.exists)
    XCTAssertTrue(textfieldsCount == 1)
    
    XCTAssertTrue(!headerText.exists)
    XCTAssertTrue(!leftColumnText.exists)
    XCTAssertTrue(!rightColumnText.exists)
  }
  
  func testEmptySummary() throws{
    let app = XCUIApplication()
    app.launch()
    
    let button = app.buttons["Summary"]
    button.tap()
    
    let textCounts = app.staticTexts.count
    let text1 = app.staticTexts["No Calculations to show."]
    let text2 = app.staticTexts["Go back and start calculating some Fibonacci numbers!"]
    
    XCTAssertTrue(textCounts == 2)
    XCTAssertTrue(text1.exists)
    XCTAssertTrue(text2.exists)
  }
  
  func testFibonacciZero() throws {
    let app = XCUIApplication()
    app.launch()
    
    let textfield = app.textFields.firstMatch
    textfield.tap()
    textfield.typeText("0")
    
    let button = app.buttons["Done"]
    button.tap()
    
    let headerText = app.staticTexts["Fibonacci Sequence"]
    let leftColumnText = app.staticTexts["N"]
    let rightColumnText = app.staticTexts["F(N)"]
    
    let zeroText = app.staticTexts["0"]
    
    XCTAssertTrue(headerText.exists)
    XCTAssertTrue(leftColumnText.exists)
    XCTAssertTrue(rightColumnText.exists)
    XCTAssertTrue(zeroText.exists)
  }
  
  func testBigNumber() throws {
    let app = XCUIApplication()
    app.launch()
    
    let textfield = app.textFields.firstMatch
    textfield.tap()
    textfield.typeText("91")
    
    let warningText = app.staticTexts["Please enter a valid number between 0 and 90"]
    
    XCTAssertTrue(warningText.exists)
  }
  
  func testSummaryNotEmpty() throws {
    let app = XCUIApplication()
    app.launch()
    
    let textfield = app.textFields.firstMatch
    textfield.tap()
    textfield.typeText("0")
    
    let button = app.buttons["Done"]
    button.tap()
    
    let summaryButton = app.buttons["Summary"]
    summaryButton.tap()
    
    let text1 = app.staticTexts["No Calculations to show."]
    let text2 = app.staticTexts["Go back and start calculating some Fibonacci numbers!"]
    
    XCTAssertTrue(!text1.exists)
    XCTAssertTrue(!text2.exists)
  }
}

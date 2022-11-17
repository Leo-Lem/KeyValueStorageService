//	Created by Leopold Lemmermann on 10.11.22.

@testable import KeyValueStorageService
import XCTest

open class KeyValueStorageServiceTests: XCTestCase {
  public var service: KeyValueStorageService!
  
  open override func setUpWithError() throws {
    try XCTSkipIf(
      service == nil,
      "Subclass these tests and insert an implementation of the private database service in the initializer!"
    )
  }
  
  func testStoringAndLoading() throws {
    let item = "HELLO",
        key = "item"
    
    service.store(item, for: key)
    
    XCTAssertEqual(service.load(for: key), item, "The loaded item does not match the stored item.")
  }
  
  func testDeletingItem() throws {
    let item = "HELLO",
        key = "item"
    
    service.store(item, for: key)
    
    service.delete(for: key)
    
    XCTAssertNil(service.load(for: key) as String?, "The item was not deleted.")
  }
}
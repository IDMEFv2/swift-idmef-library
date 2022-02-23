import XCTest
@testable import IDMEF

func serialize(msg: IDMEFObject, outFile: String) {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    if let jsonData = try? encoder.encode(msg) {
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            do {
                try jsonString.write(to: URL(fileURLWithPath: outFile), atomically: true, encoding: String.Encoding.utf8)
            } catch {
                XCTFail()
            }            
        }
    }
    
    XCTAssert(true)

}

final class IDMEFSerializeTests: XCTestCase {
    func test1() throws {
        serialize(msg: message1(), outFile: "out1.json")
    } 

    func test2() throws {
        serialize(msg: message2(), outFile: "out2.json")
    }
}

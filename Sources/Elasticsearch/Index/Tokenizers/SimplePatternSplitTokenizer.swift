
import Foundation

public struct SimplePatternSplitTokenizer: Tokenizer {
    /// :nodoc:
    public static var typeKey = TokenizerType.simplePatternSplit
    
    let type = typeKey.rawValue
    
    public let name: String

    public var pattern: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case type
        case pattern
    }
    
    public init(name: String, pattern: String? = nil) {
        self.name = name
        self.pattern = pattern
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = (decoder.codingPath.last?.stringValue)!
        
        self.pattern = try container.decodeIfPresent(String.self, forKey: .pattern)
    }
}
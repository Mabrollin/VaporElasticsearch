
import Foundation

public struct ModelDoubleRange: ModelType {
    public var lte: Double
    public var gte: Double
}

extension ModelDoubleRange {
    public static let backingType: Mappable.Type = Mapping.self

    public struct Mapping: Mappable {
        /// Holds the string that Elasticsearch uses to identify the mapping type
        public let type = MapType.doubleRange
        public var coerce: Bool? = nil
        public var boost: Float? = nil
        public var index: Bool? = nil
        public var store: Bool? = nil
        
        enum CodingKeys: String, CodingKey {
            case type
            case coerce
            case boost
            case index
            case store
        }
        
        public init() { }
        
        public init(index: Bool? = nil,
                    store: Bool? = nil,
                    boost: Float? = nil,
                    coerce: Bool? = nil) {
            
            self.index = index
            self.store = store
            self.boost = boost
            self.coerce = coerce
        }
    }

}
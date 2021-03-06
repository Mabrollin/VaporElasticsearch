/*
 These structs define all of the types that Elasticsearch can store,
 how they map to Swift types and allows the user to configure what
 the mapping should be like in their index.
 
 The list of types in Elasticsearch can be found at:
 https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping-types.html
 */

public struct MapScaledFloat: Mappable {
    /// :nodoc:
    public static var typeKey = MapType.scaledFloat

    /// Holds the string that Elasticsearch uses to identify the mapping type
    public let type = typeKey.rawValue
    public let coerce: Bool?
    public let boost: Float?
    public let docValues: Bool?
    public let ignoreMalformed: Bool?
    public let index: Bool?
    public let nullValue: Float?
    public let store: Bool?
    
    public var scalingFactor: Int? = 0
    
    enum CodingKeys: String, CodingKey {
        case type
        case coerce
        case boost
        case docValues = "doc_values"
        case ignoreMalformed = "ignore_malformed"
        case index
        case nullValue = "null_value"
        case store
        case scalingFactor = "scaling_factor"
    }
    
    public init(scalingFactor: Int? = nil,
                docValues: Bool? = nil,
                index: Bool? = nil,
                store: Bool? = nil,
                boost: Float? = nil,
                coerce: Bool? = nil,
                ignoreMalformed: Bool? = nil,
                nullValue: Float? = nil) {
        
        self.scalingFactor = scalingFactor
        self.coerce = coerce
        self.boost = boost
        self.docValues = docValues
        self.ignoreMalformed = ignoreMalformed
        self.index = index
        self.nullValue = nullValue
        self.store = store
    }
}

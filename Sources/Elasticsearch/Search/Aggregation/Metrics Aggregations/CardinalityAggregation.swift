
import Foundation

public struct CardinalityAggregation: Aggregation {
    public static var typeKey = AggregationResponseMap.cardinality
    
    public var codingKey = "cardinality"
    public var name: String

    let field: String?
    let precisionThreshold: Int?
    let script: Script?
    let missing: String?
    
    enum CodingKeys: String, CodingKey {
        case field
        case precisionThreshold = "precision_threshold"
        case script
        case missing
    }
    
    /// Create a [cardinality](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-metrics-cardinality-aggregation.html) aggregation
    ///
    /// - Parameters:
    ///   - name: The aggregation name
    ///   - field: The field to perform the aggregation over
    ///   - precisionThreshold: Allows to trade memory for accuracy, and defines a unique count below which counts are expected to be close to accurate
    ///   - script: A script used to calculate the values
    ///   - missing: Defines how documents that are missing a value should be treated
    public init(
        name: String,
        field: String? = nil,
        precisionThreshold: Int? = nil,
        script: Script? = nil,
        missing: String? = nil
        ) {
        self.name = name
        self.field = field
        self.precisionThreshold = precisionThreshold
        self.script = script
        self.missing = missing
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DynamicKey.self)
        var valuesContainer = container.nestedContainer(keyedBy: CodingKeys.self, forKey: DynamicKey(stringValue: codingKey)!)
        try valuesContainer.encodeIfPresent(field, forKey: .field)
        try valuesContainer.encodeIfPresent(precisionThreshold, forKey: .precisionThreshold)
        try valuesContainer.encodeIfPresent(script, forKey: .script)
        try valuesContainer.encodeIfPresent(missing, forKey: .missing)
    }
}

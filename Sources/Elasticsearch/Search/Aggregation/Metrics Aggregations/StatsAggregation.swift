
import Foundation

public struct StatsAggregation: Aggregation {
    public static var typeKey = AggregationResponseMap.stats
    
    public var codingKey = "stats"
    public var name: String
    
    let field: String?
    let script: Script?
    let missing: Int?
    
    enum CodingKeys: String, CodingKey {
        case field
        case script
        case missing
    }
    
    /// Creates a [stats](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-metrics-stats-aggregation.html) aggregation
    ///
    /// - Parameters:
    ///   - name: The aggregation name
    ///   - field: The field to perform the aggregation over
    ///   - script: A script used to calculate the values
    ///   - missing: Defines how documents that are missing a value should be treated
    public init(
        name: String,
        field: String? = nil,
        script: Script? = nil,
        missing: Int? = nil
        ) {
        self.name = name
        self.field = field
        self.script = script
        self.missing = missing
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DynamicKey.self)
        var valuesContainer = container.nestedContainer(keyedBy: CodingKeys.self, forKey: DynamicKey(stringValue: codingKey)!)
        try valuesContainer.encodeIfPresent(field, forKey: .field)
        try valuesContainer.encodeIfPresent(script, forKey: .script)
        try valuesContainer.encodeIfPresent(missing, forKey: .missing)
    }
}

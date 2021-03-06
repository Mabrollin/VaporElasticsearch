/*
 These structs define all of the types that Elasticsearch can store,
 how they map to Swift types and allows the user to configure what
 the mapping should be like in their index.
 
 The list of types in Elasticsearch can be found at:
 https://www.elastic.co/guide/en/elasticsearch/reference/current/mapping-types.html
 */

public struct MapGeoShape: Mappable {
    /// :nodoc:
    public static var typeKey = MapType.geoShape

    public enum GeoShapePrefixTree: String, Codable {
        case geohash
        case quadtree
    }
    
    public enum GeoShapePrecision: String, Codable {
        case `in`
        case inch
        case yd
        case yard
        case mi
        case miles
        case km
        case kilometers
        case m
        case meters
        case cm
        case centimeters
        case mm
        case millimeters
    }
    
    public enum GeoShapeStrategy: String, Codable {
        case recursive = "recursive"
        case term = "term"
    }
    
    public enum GeoShapeOrientation: String, Codable {
        case right = "right"
        case ccw = "ccw"
        case counterclockwise = "counterclockwise"
        case left = "left"
        case cw = "cw"
        case clockwise = "clockwise"
    }
    
    /// Holds the string that Elasticsearch uses to identify the mapping type
    public let type = typeKey.rawValue
    public let tree: GeoShapePrefixTree?
    public let precision: GeoShapePrecision?
    public let treeLevels: String?
    public let strategy: GeoShapeStrategy?
    public let distanceErrorPct: Float?
    public let orientation: GeoShapeOrientation?
    public let pointsOnly: Bool?
    public let ignoreMalformed: Bool?
    
    enum CodingKeys: String, CodingKey {
        case type
        case tree
        case precision
        case treeLevels = "tree_levels"
        case strategy = "null_value"
        case distanceErrorPct = "distance_error_pct"
        case orientation
        case pointsOnly = "points_only"
        case ignoreMalformed = "ignore_malformed"
    }
    
    public init(tree: GeoShapePrefixTree? = nil,
                precision: GeoShapePrecision? = nil,
                treeLevels: String? = nil,
                strategy: GeoShapeStrategy? = nil,
                distanceErrorPct: Float? = nil,
                orientation: GeoShapeOrientation? = nil,
                pointsOnly: Bool? = nil,
                ignoreMalformed: Bool? = nil) {
        
        self.tree = tree
        self.precision = precision
        self.treeLevels = treeLevels
        self.strategy = strategy
        self.distanceErrorPct = distanceErrorPct
        self.orientation = orientation
        self.pointsOnly = pointsOnly
        self.ignoreMalformed = ignoreMalformed
    }
}




struct Constants {
    
    //The API's base URL
    static let baseUrl = "http://165.22.36.144:81/api"
    static let tokenGeneratorUrl = "https://najeemy.herokuapp.com"

    //The parameters (Queries) that we're gonna use
    struct Parameters {
        static let userId = "userId"
        static let token = ""
    }
    
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
    }
    
    //The content type (JSON)
    enum ContentType: String {
        case json = "application/json"
    }
}

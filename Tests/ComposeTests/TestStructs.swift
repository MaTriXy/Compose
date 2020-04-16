import Foundation
import Compose

struct Developer: Codable, Hashable {
    var name: String
    var age: Int
}

struct RemoteLocation: Codable, Hashable {
    var country: String
    var city: String
}

struct TeamLead: Codable, Hashable {
    var team: String
    var salary: Int
}

typealias RemoteDeveloper = Compose<Developer, RemoteLocation>
typealias RemoteTeamLead = Compose3<TeamLead, Developer, RemoteLocation>

let remoteDeveloper = RemoteDeveloper(.init(name: "Andres", age: 26), .init(country: "Spain", city: "Madrid"))
let remoteTeamLead = RemoteTeamLead(.init(team: "iOS", salary: 1000000), remoteDeveloper)

enum NetworkError: String, LocalizedError {
    case noInternet

    var errorDescription: String? { rawValue }
    var failureReason: String? { rawValue }
    var recoverySuggestion: String? { rawValue }
    var helpAnchor: String? { rawValue }
}

enum DatabaseError: String, LocalizedError {
    case elementNotFound

    var errorDescription: String? { rawValue }
    var failureReason: String? { rawValue }
    var recoverySuggestion: String? { rawValue }
    var helpAnchor: String? { rawValue }
}

typealias AppError = Compose<NetworkError, DatabaseError>

let appError = AppError(.noInternet, .elementNotFound)
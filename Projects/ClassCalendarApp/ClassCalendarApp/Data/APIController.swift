//
//  APIController.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 1/29/26.
//
import Foundation

struct LoginRequstInfo: Codable {
    let email: String
    let password: String
}

class APIController {
    
    enum QueryError: Error, LocalizedError {
        case badResponse
        case systemError
    }
    
    func fetchUser(email: String, password: String) async throws -> User {
        
        do {
            let url = URL(string: "https://social-media-app.ryanplitt.com/auth/login")!
            
            var components = URLComponents()
            components.queryItems = [
                URLQueryItem(name: "email", value: email),
                URLQueryItem(name: "password", value: password)
                ]
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = components.percentEncodedQuery?.data(using: .utf8)
            
            
            let (dataResponse, response) = try await URLSession.shared.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(User.self, from: dataResponse)
                    return user
                } else {
                    print("error: \(httpResponse.statusCode)")
                    throw QueryError.badResponse
                }
            } else {
                print("bad url response: \(response)")
                throw QueryError.systemError
            }
        }
    }
    
    func fetchAllDays(secret: String) async throws -> [Day] {
        
        do {
            let url = URL(string: "https://social-media-app.ryanplitt.com/calendar/all?cohort=fall2025")!
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("Bearer \(secret)", forHTTPHeaderField: "Authorization")
            
            let (dataResponse, response) = try await URLSession.shared.data(for: urlRequest)
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
//                    print(String(data: dataResponse, encoding: .utf8))
                    let days = try decoder.decode([Day].self, from: dataResponse)
//                    print(days)
                    return days
                } else {
                    print("error: \(httpResponse.statusCode)")
                    throw QueryError.badResponse
                }
            } else {
                print("bad url response: \(response)")
                throw QueryError.systemError
            }
        }
        
    }
    
    func fetchToday(secret: String) async throws -> Day {
        
        do {
            let url = URL(string: "https://social-media-app.ryanplitt.com/calendar/today?cohort=fall2025")!
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("Bearer \(secret)", forHTTPHeaderField: "Authorization")
            
            let (dataResponse, response) = try await URLSession.shared.data(for: urlRequest)
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let day = try decoder.decode(Day.self, from: dataResponse)
                    return day
                } else {
                    print("error: \(httpResponse.statusCode)")
                    throw QueryError.badResponse
                }
            } else {
                print("bad url response: \(response)")
                throw QueryError.systemError
            }
            
        }
    }
    
    func fetchDayDate(secret: String, date: String) async throws -> Day {
        let dateComponents = date.components(separatedBy: "/")
        let month: String
            if dateComponents[0].count == 1 {
                month = "0\(dateComponents[0])"
            } else {
                month = dateComponents[0]
            }
        
        let day: String
            if dateComponents[1].count == 1 {
                day = "0\(dateComponents[1])"
            } else {
                day = dateComponents[1]
            }
        
        let year = dateComponents[2]
        let formattedDate = "\(year)-\(month)-\(day)"
        
        do {
            let url = URL(string: "https://social-media-app.ryanplitt.com/calendar/date/\(formattedDate)?cohort=fall2025")!
//            print("https://social-media-app.ryanplitt.com/calendar/date/\(formattedDate)?cohort=fall2025")
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("Bearer \(secret)", forHTTPHeaderField: "Authorization")
            
            let (dataResponse, response) = try await URLSession.shared.data(for: urlRequest)
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let day = try decoder.decode(Day.self, from: dataResponse)
                    return day
                } else {
                    print("error: \(httpResponse.statusCode)")
                    throw QueryError.badResponse
                }
            } else {
                print("bad url response: \(response)")
                throw QueryError.systemError
            }
            
        }
    }
    
}

//
//  Profile.swift
//  GeometryReaderLab
//
//  Created by Logan Steven Bartell on 1/6/26.
//
import Foundation

struct Profile {
    var name: String
    var description: String
}

extension Profile {
    static let list: [Profile] = [
        Profile(name: "joe", description: "tall"),
        Profile(name: "jack", description: "happy"),
        Profile(name: "john", description: "sad"),
        Profile(name: "jude", description: "short"),
        Profile(name: "jackie", description: "normal")
    ]
}

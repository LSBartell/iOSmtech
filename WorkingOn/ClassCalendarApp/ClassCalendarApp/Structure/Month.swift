//
//  Month.swift
//  ClassCalendarApp
//
//  Created by Logan Steven Bartell on 11/6/25.
//
import Foundation

struct Month {
    let fullName: String
    var shortName: String {
        String(self.fullName.prefix(3))
    }
    let monthNumber: Int
}

//
//  Item.swift
//  prototyping
//
//  Created by octavia octavia on 14/01/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

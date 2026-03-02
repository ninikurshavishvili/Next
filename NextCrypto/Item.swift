//
//  Item.swift
//  NextCrypto
//
//  Created by Nini Kurshavishvili on 02.03.26.
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

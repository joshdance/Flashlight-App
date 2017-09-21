//
//  SwitchStatus.swift
//  Light App
//
//  Created by Joshua Dance on 9/19/17.
//  Copyright © 2017 Joshua Dance. All rights reserved.
//

import Foundation

enum SwitchStatus: Toggleable {
    case on
    case off
    
    mutating func toggle() {
        switch self {
        case SwitchStatus.on:
            self = .off
        case .off:
            self = SwitchStatus.on
        }
    }
}

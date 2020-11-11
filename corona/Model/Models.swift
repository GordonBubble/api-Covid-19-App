//
//  Models.swift
//  corona
//
//  Created by Яблочко on 01.11.2020.
//  Copyright © 2020 Roman Avdonin. All rights reserved.
//

import Foundation

struct CovidAll: Codable {
    var deaths: Int
    var active: Int
    var cases: Int
    var recovered: Int
}

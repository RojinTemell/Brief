//
//  APIConfig.swift
//  Brief
//
//  Created by rojin on 4.05.2026.
//

import Foundation

struct APIConfig {
    static func apiKey() throws -> String {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String,
              !key.isEmpty else {
            throw AppError.missingAPIKey
        }
        return key
    }
    }

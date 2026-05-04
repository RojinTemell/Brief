//
//  APIConfig.swift
//  Brief
//
//  Created by rojin on 4.05.2026.
//

import Foundation

struct APIConfig {
    static var apiKey: String {
        // 'ApiKey' ismi Info.plist'e eklediğin Key ismiyle birebir aynı olmalı
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("Hata: Info.plist içinde 'ApiKey' bulunamadı.")
        }
        return key
    }
}

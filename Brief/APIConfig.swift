//
//  APIConfig.swift
//  Brief
//
//  Created by rojin on 4.05.2026.
//

import Foundation

struct APIConfig {
    static var apiKey: String {
        // 'API_KEY' ismi Info.plist'e eklediğin Key ismiyle birebir aynı olmalı
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String,
              !key.isEmpty else {
            fatalError("Hata: Info.plist içinde 'API_KEY' bulunamadı veya boş. Config.xcconfig'in projeye bağlı olduğundan ve API_KEY değerinin dolu olduğundan emin ol.")
        }
        return key
    }
}

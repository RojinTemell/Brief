//
//  Article.swift
//  Brief
//
//  Created by rojin on 4.05.2026.
//

import SwiftUI

struct NewsResponse: Codable {
    let articles: [Article]
}

struct Article :Codable,Hashable,Identifiable{
    let id :String
    let title:String
    let description:String
    let content:String
    let url:String
    let image:String
    let publishedAt:String
    let lang:String
    let source:Source
}

struct Source :Codable,Hashable,Identifiable{
    let id:String
    let name:String
    let url:String
    //    let country:String
}

struct ArticleList {
    static let mockArticle = [
        Article(id: "1",
                title: "Fenerbahçe, sezonu beraberlikle tamamladı! Eyüpspor kümede kaldı... (Maç özeti", description:  "Fenerbahçe, Trendyol Süper Lig'in son hafta mücadelesinde Eyüpspor'u konuk etti. Sarı-lacivertli takım, sahadan 3-3'lük beraberlikle ayrıldı. Kanarya'nın...",
                content: "\"Düşme hattını ilgilendiren kritik bir maça çıkıyoruz. Sahada göstereceğimiz karakter önemli çünkü bu birçok takımın kaderini etkileyebilir. Oyunun her anında en iyisini yapmaya çalışacağız. Fenerbahçe formasıyla çıktığınız her maç galibiyet gerekir.... [1234 chars]",
                url:  "https://www.fanatik.com.tr/fenerbahce/live-fenerbahce-sezonu-beraberlikle-tamamladi-eyupspor-kumede-kaldi-mac-ozeti-fenerbahce-3-3-eyupspor-2623792",
                image: "https://image.fanatik.com.tr/i/fanatik/75/1200x675/6a0a0ee9783c4d727fddf892.jpg", publishedAt: "2026-05-17T19:16:00Z", lang: "tr", source: Source(id: "1", name: "Fanatik", url: "https://www.fanatik.com.tr")),
        Article(id: "2",
                title: "Trabzonspor 0-3 Gençlerbirliği (Süper Lig maçı özeti)",
                description:  "Spor Haberleri - Gençlerbirliği, Süper Lig sezonu kapanış haftasında Trabzonspor'u deplasmanda 3-0 yenerek ligde kaldı.",
                content:  "×\nTÜRKİYE SÜPER LİGTÜRKİYE KUPASIMİLLİ TAKIMLARAVRUPA LİGLERİ\nİNGİLTERE PREMİER LİGİBUNDESLİGA LA LİGASERİE AFRANSA LİGUE 1\nUEFA ŞAMPİYONLAR LİGİUEFA AVRUPA LİGİUEFA KONFERANS LİGİNBAEUROLEAGUETBSLMOTOR SPORLARIDİĞERTV REHBERİ\nGünlük Egazete© Copyrig... [300 chars]",
                url:  "https://www.hurriyet.com.tr/sporarena/trabzonspor-0-3-genclerbirligi-super-lig-maci-ozeti-43175659",
                image:"https://image.hurimg.com/i/hurriyet/90/0x0/6a0a0f5f3664a5bc10947a46.jpg",
                publishedAt: "2026-05-17T19:16:00Z",
                lang: "tr",
                source: Source(id: "2", name: "Hürriyet", url: "https://www.hurriyet.com.tr"))
    ]
}

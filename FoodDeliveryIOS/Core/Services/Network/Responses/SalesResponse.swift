//
//  SalesResponse.swift
//  TestProject
//
//  Created by Roman Kiruxin on 19.10.2022.
//

struct SalesResponse: Codable {
    let data: [Sales]
}

struct Sales: Codable {
    let image: String?
}

//{
//    "data": [
//        {
//            "image": "https://i.postimg.cc/pTXJQRmN/Rectangle-38.png"
//        },
//        {
//            "image": "https://i.postimg.cc/pTXJQRmN/Rectangle-38.png"
//        },
//        {
//            "image": "https://i.postimg.cc/pTXJQRmN/Rectangle-38.png"
//        },
//        {
//            "image": "https://i.postimg.cc/pTXJQRmN/Rectangle-38.png"
//        }
//    ]
//}

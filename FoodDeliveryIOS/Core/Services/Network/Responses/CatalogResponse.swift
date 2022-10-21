//
//  CatalogResponse.swift
//  TestProject
//
//  Created by Roman Kiruxin on 19.10.2022.
//

import Foundation

struct CatalogResponse: Codable {
    let data: [Product]
}

struct Product: Codable {
    let name: String?
    let image: String?
    let description: String?
    let cost: Int?
    let category: String?
}


//{
//    "data": [
//                {
//                    "name": "Пеперони",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/44a197add75641e3a2ca2ae879b7fd40_584x584.jpeg",
//                    "description": "Горячая закуска с острым цыпленком, перцем халапеньо, солеными огурчиками, томатами, моцареллой и соусом барбекю в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 1
//                },
//                {
//                    "name": "4сыра",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/44fa9ef30b664565bd1fc05af780905b_584x584.jpeg",
//                    "description": "Легендарная горячая закуска с цыпленком, томатами, моцареллой, соусом ранч в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 1
//                },
//                {
//                    "name": "Мясная",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/2ec8a54a9a7d44a68b3f97e4b37ed426_584x584.jpeg",
//                    "description": "Горячая закуска с пикантным соусом чипотле из копченых перчиков, цыпленком, томатами, моцареллой в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 1
//                },
//                {
//                    "name": "Куриная",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/38fcdc71fc4c4303a0a929cd2c635b9d_584x584.jpeg",
//                    "description": "Горячая закуска с шампиньонами, моцареллой и соусом ранч в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 1
//                },
//                {
//                    "name": "Обжора",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/b51d76666eb842d1a3c7c4879c4e3b0e_584x584.jpeg",
//                    "description": "Горячая закуска с острыми колбасками чоризо, острым цыпленком, перцем халапеньо, моцареллой и соусом сальса в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 1
//                },
//                {
//                    "name": "Фирменная",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/a846802a549043e9905744c9c85af53e_584x584.jpeg",
//                    "description": "Горячая закуска с митболами из говядины, томатами, моцареллой и пикантным соусом чипотле в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 1
//                },
//                {
//                    "name": "Пеперони",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/44a197add75641e3a2ca2ae879b7fd40_584x584.jpeg",
//                    "description": "Горячая закуска с острым цыпленком, перцем халапеньо, солеными огурчиками, томатами, моцареллой и соусом барбекю в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 2
//                },
//                {
//                    "name": "4сыра",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/44fa9ef30b664565bd1fc05af780905b_584x584.jpeg",
//                    "description": "Легендарная горячая закуска с цыпленком, томатами, моцареллой, соусом ранч в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 2
//                },
//                {
//                    "name": "Мясная",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/2ec8a54a9a7d44a68b3f97e4b37ed426_584x584.jpeg",
//                    "description": "Горячая закуска с пикантным соусом чипотле из копченых перчиков, цыпленком, томатами, моцареллой в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 2
//                },
//                {
//                    "name": "Куриная",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/38fcdc71fc4c4303a0a929cd2c635b9d_584x584.jpeg",
//                    "description": "Горячая закуска с шампиньонами, моцареллой и соусом ранч в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 2
//                },
//                {
//                    "name": "Обжора",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/b51d76666eb842d1a3c7c4879c4e3b0e_584x584.jpeg",
//                    "description": "Горячая закуска с острыми колбасками чоризо, острым цыпленком, перцем халапеньо, моцареллой и соусом сальса в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 2
//                },
//                {
//                    "name": "Фирменная",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/a846802a549043e9905744c9c85af53e_584x584.jpeg",
//                    "description": "Горячая закуска с митболами из говядины, томатами, моцареллой и пикантным соусом чипотле в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 2
//                },
//                {
//                    "name": "Пеперони",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/44a197add75641e3a2ca2ae879b7fd40_584x584.jpeg",
//                    "description": "Горячая закуска с острым цыпленком, перцем халапеньо, солеными огурчиками, томатами, моцареллой и соусом барбекю в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 3
//                },
//                {
//                    "name": "4сыра",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/44fa9ef30b664565bd1fc05af780905b_584x584.jpeg",
//                    "description": "Легендарная горячая закуска с цыпленком, томатами, моцареллой, соусом ранч в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 3
//                },
//                {
//                    "name": "Мясная",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/2ec8a54a9a7d44a68b3f97e4b37ed426_584x584.jpeg",
//                    "description": "Горячая закуска с пикантным соусом чипотле из копченых перчиков, цыпленком, томатами, моцареллой в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 3
//                },
//                {
//                    "name": "Куриная",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/38fcdc71fc4c4303a0a929cd2c635b9d_584x584.jpeg",
//                    "description": "Горячая закуска с шампиньонами, моцареллой и соусом ранч в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 3
//                },
//                {
//                    "name": "Обжора",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/b51d76666eb842d1a3c7c4879c4e3b0e_584x584.jpeg",
//                    "description": "Горячая закуска с острыми колбасками чоризо, острым цыпленком, перцем халапеньо, моцареллой и соусом сальса в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 3
//                },
//                {
//                    "name": "Фирменная",
//                    "image": "https://dodopizza-a.akamaihd.net/static/Img/Products/a846802a549043e9905744c9c85af53e_584x584.jpeg",
//                    "description": "Горячая закуска с митболами из говядины, томатами, моцареллой и пикантным соусом чипотле в тонкой пшеничной лепешке",
//                    "cost": 350,
//                    "categoryId": 3
//                }
//        ]
//}
//
//
//

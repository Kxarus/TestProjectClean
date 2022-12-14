//
//  CardInteractor.swift
//  TestProject
//
//  Created by Roman Kiruxin on 19.10.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CardBusinessLogic {
    func doSomething(request: Card.Something.Request)
}

protocol CardDataStore {
    //var name: String { get set }
}

class CardInteractor: CardBusinessLogic, CardDataStore {
    
    var presenter: CardPresentationLogic?
    var worker: CardWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: Card.Something.Request) {
        worker = CardWorker()
        worker?.doSomeWork()
        
        let response = Card.Something.Response()
        presenter?.presentSomething(response: response)
    }
}

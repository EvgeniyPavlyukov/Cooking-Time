//
//  Interactor.swift
//  Cooking time
//
//  Created by Eвгений Павлюков on 28.11.2022.
//

import Foundation

class Interactor: InteractorInputProtocol {
    
    weak var output: InteractorOutputProtocol! //это слабая ссылка на презентер так как презентер держит сильную на интерактор
    
}

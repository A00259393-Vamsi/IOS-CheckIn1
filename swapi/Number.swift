//
//  Number.swift
//  swapi
//
//  Created by Snehith Reddy Yeruva on 16/12/22.
//

import Foundation

class Number {
    var numberValue: String;
    var numberStatement: String;
    var isFavorite: Bool;
    
    init(numberValue: String, numberStatement: String, isFavorite: Bool) {
        self.numberValue = numberValue;
        self.numberStatement = numberStatement;
        self.isFavorite = isFavorite;
    }
}

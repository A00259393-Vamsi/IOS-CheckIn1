//
//  NumberHelper.swift
//  swapi
//
//  Created by Vamsi Allu on 16/12/22.
//

import Foundation

class NumberHelper {
    static var numberList : [Number] = [
        Number(numberValue: "42", numberStatement: "42 is the number of little squares forming the left side trail of Microsoft's Windows 98 logo.", isFavorite: false),
        Number(numberValue: "41", numberStatement: "41 is the number of soldiers in The Expendables (2010 film) tactor Eric Roberts laments to his subordinates about having been killed by star Sylvester Stallone in his escape from their island.", isFavorite: false),
        Number(numberValue: "40", numberStatement: "40 is the number of points that a Premier League team needs to avoid relegation in soccer.", isFavorite: false),
        Number(numberValue: "39", numberStatement: "39 is the duration, in nanoseconds, of the nuclear reaction in the largest nuclear explosion ever performed (Tsar bomb).", isFavorite: true),
        Number(numberValue: "38", numberStatement: "38 is the number of slots on an American Roulette wheel (0, 00, and 1 through 36; European roulette does not use the 00 slot and has only 37 slots).", isFavorite: true)
    ]
    
    static func setNumberList(number : Number){
        numberList.append(number);
    }
    
    static func getNumberList() -> [Number] {
        return numberList;
    }
}

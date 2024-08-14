//
//  PetData.swift
//  ChartsPro
//
//  Created by Olibo moni on 09/08/2024.
//

import Foundation


struct PetData: Identifiable, Equatable {
    let year: Int
    
    let population: Double
    // population is in million
    
    var id: Int { year }
    
    static var catExample: [PetData] {
        [PetData(year: 2000, population: 6.8),
         PetData(year: 2010, population: 8.2),
         PetData(year: 2015, population: 12.9),
         PetData(year: 2022, population: 15.2)]
    }
    
    static var dogExample: [PetData] {
        [PetData(year: 2000, population: 5),
         PetData(year: 2010, population: 5.3),
         PetData(year: 2015, population: 7.9),
         PetData(year: 2022, population: 10.6)]
    }
    
}

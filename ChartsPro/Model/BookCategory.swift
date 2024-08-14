//
//  BookCategory.swift
//  ChartsPro
//
//  Created by Olibo moni on 11/08/2024.
//

import Foundation

enum BookCategory: Identifiable, CaseIterable {
        case fiction
        case biography
        case children
        case computerScience
        case fantasy
        case business
    
    var id: Self {
        return self
    }
    
    var displayName: String {
        switch self {
        case .fiction:
            "Fiction"
        case .biography:
            "Biography"
        case .children:
            "Children"
        case .computerScience:
            "Computer Science"
        case .fantasy:
            "Fantasy"
        case .business:
            "Business"
        }
    }
}

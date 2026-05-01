//
//  ArticleDetailsViewModel.swift
//  FeatureFactoryExample
//
//  Created by Mikalai Zmachynski on 01/05/2026.
//

import Foundation

@Observable
final class ArticleDetailsViewModel {
    private let id: String
    
    init(id: String) {
        self.id = id
    }
}

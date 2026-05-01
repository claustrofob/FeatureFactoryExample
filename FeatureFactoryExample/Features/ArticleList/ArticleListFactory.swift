//
//  ArticleListFactory.swift
//  FeatureFactoryExample
//
//  Created by Mikalai Zmachynski on 01/05/2026.
//

import SwiftUI

struct ArticleListFactory {
    static func view() -> some View {
        FeatureFactory.view(
            viewModelFactory: { _ in ArticleListViewModel() },
            viewFactory: { ArticleListView(viewModel: $0) }
        )
    }
}

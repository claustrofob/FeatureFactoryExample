//
//  ArticleDetailsFactory.swift
//  FeatureFactoryExample
//
//  Created by Mikalai Zmachynski on 01/05/2026.
//

import SwiftUI

struct ArticleDetailsFactory {
    static func view(id: String) -> some View {
        FeatureFactory.view(
            input: id,
            viewModelFactory: { ArticleDetailsViewModel(id: $0) },
            viewFactory: { ArticleDetailsView(viewModel: $0) }
        )
    }
}

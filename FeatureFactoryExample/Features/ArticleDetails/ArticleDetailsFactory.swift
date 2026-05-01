//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import SwiftUI

enum ArticleDetailsFactory {
    static func view(id: Article.ID) -> some View {
        FeatureFactory.view(
            input: id,
            viewModelFactory: { ArticleDetailsViewModel(id: $0) },
            viewFactory: { ArticleDetailsView(viewModel: $0) }
        )
    }
}

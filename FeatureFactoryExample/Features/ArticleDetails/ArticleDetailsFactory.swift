//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import SwiftUI

struct ArticleDetailsFactory: Hashable {
    let id: Article.ID

    func view() -> some View {
        FeatureFactoryV2.view(
            input: id,
            viewModelFactory: {
                ArticleDetailsViewModel(id: $0, repository: ArticlesRepository())
            },
            viewFactory: { ArticleDetailsView(viewModel: $0) }
        )
    }
}

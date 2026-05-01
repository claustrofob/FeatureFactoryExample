//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import SwiftUI

struct ArticleListFactory: Hashable {
    func view() -> some View {
        FeatureFactoryV2.view(
            viewModelFactory: { _ in
                ArticleListViewModel(repository: ArticlesRepository())
            },
            viewFactory: { ArticleListView(viewModel: $0) }
        )
    }
}

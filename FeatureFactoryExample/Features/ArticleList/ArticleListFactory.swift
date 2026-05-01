//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import SwiftUI

enum ArticleListFactory {
    static func view() -> some View {
        FeatureFactory.view(
            viewModelFactory: { _ in ArticleListViewModel() },
            viewFactory: { ArticleListView(viewModel: $0) }
        )
    }
}

//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Foundation

@Observable
final class ArticleListViewModel {
    private(set) var articles: [Article] = []

    init() {}

    private func load() async {
        articles = await ArticlesRepository.loadAll()
    }

    func viewDidAppear() {
        Task { await load() }
    }
}

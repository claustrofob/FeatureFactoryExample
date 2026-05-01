//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Foundation

@Observable
final class ArticleListViewModel: ArticleListViewModelProtocol {
    private let repository: ArticlesRepositoryProtocol

    var articles: [Article] = []

    init(repository: ArticlesRepositoryProtocol) {
        self.repository = repository
    }

    private func load() async {
        articles = await repository.loadAll()
    }

    func viewDidAppear() {
        Task { await load() }
    }
}

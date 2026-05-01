//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Foundation

@Observable
final class ArticleDetailsViewModel: ArticleDetailsViewModelProtocol {
    private let id: Article.ID
    private let repository: ArticlesRepositoryProtocol

    var article: Article?

    init(id: Article.ID, repository: ArticlesRepositoryProtocol) {
        self.id = id
        self.repository = repository
    }

    private func load() async {
        article = await repository.article(id: id)
    }

    func viewDidAppear() {
        Task { await load() }
    }
}

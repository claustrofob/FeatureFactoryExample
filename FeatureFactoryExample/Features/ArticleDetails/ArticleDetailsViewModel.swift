//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Foundation

@Observable
final class ArticleDetailsViewModel {
    private let id: Article.ID

    private(set) var article: Article?

    init(id: Article.ID) {
        self.id = id
    }

    private func load() async {
        article = await ArticlesRepository.article(id: id)
    }

    func viewDidAppear() {
        Task { await load() }
    }
}

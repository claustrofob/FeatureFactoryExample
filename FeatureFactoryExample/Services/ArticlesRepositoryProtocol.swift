//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Foundation

protocol ArticlesRepositoryProtocol {
    func loadAll() async -> [Article]
    func article(id: Article.ID) async -> Article?
}

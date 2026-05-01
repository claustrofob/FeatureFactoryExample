//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Foundation

@Observable
final class ArticleDetailsViewModel {
    private let id: String

    init(id: String) {
        self.id = id
    }
}

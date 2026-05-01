//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Foundation

struct Article: Identifiable, Hashable {
    let id: String
    let title: String
    let summary: String
    let body: String
    let author: String
    let publishedAt: Date
}

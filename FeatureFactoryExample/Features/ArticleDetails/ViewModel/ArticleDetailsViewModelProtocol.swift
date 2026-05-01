//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Foundation

protocol ArticleDetailsViewModelProtocol: Observable {
    var article: Article? { get }

    func viewDidAppear()
}

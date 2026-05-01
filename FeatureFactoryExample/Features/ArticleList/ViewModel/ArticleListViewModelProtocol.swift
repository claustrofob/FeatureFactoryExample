//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import Foundation

protocol ArticleListViewModelProtocol: AnyObject {
    var articles: [Article] { get }

    func viewDidAppear()
}

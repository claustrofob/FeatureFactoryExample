//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TimelineView(.animation) { _ in
            ArticleListFactory.view()
        }
    }
}

#Preview {
    ContentView()
}

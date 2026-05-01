//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import SwiftUI

struct ArticleDetailsView: View {
    let viewModel: ArticleDetailsViewModelProtocol

    var body: some View {
        ScrollView {
            if let article = viewModel.article {
                content(for: article)
            } else {
                ProgressView()
                    .padding(.top, 40)
            }
        }
        .navigationTitle(viewModel.article?.title ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.viewDidAppear()
        }
    }

    private func content(for article: Article) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(article.title)
                .font(.largeTitle.bold())
            HStack(spacing: 8) {
                Text(article.author)
                Text("·")
                Text(article.publishedAt, style: .date)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            Text(article.summary)
                .font(.title3)
                .foregroundStyle(.secondary)
            Text(article.body)
                .font(.body)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
    }
}

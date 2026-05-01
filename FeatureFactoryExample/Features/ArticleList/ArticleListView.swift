//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import SwiftUI

struct ArticleListView<ViewModel: ArticleListViewModelProtocol>: View {
    let viewModel: ViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.articles) { article in
                        NavigationLink(value: ArticleDetailsFactory(id: article.id)) {
                            ArticleRow(article: article)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
            .navigationTitle("Articles")
            .navigationDestination(for: ArticleDetailsFactory.self) { factory in
                factory.view()
            }
        }
        .onAppear {
            viewModel.viewDidAppear()
        }
    }
}

private struct ArticleRow: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(article.title)
                .font(.headline)
                .multilineTextAlignment(.leading)
            Text(article.summary)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.leading)
            HStack {
                Text(article.author)
                Spacer()
                Text(article.publishedAt, style: .date)
            }
            .font(.caption)
            .foregroundStyle(.tertiary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

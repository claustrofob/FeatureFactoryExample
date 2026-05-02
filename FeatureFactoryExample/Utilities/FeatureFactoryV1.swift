//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import SwiftUI

// As described in Apple's documentation: https://developer.apple.com/documentation/swiftui/state
//
// "A State property always instantiates its default value when SwiftUI instantiates the view.
//  For this reason, avoid side effects and performance-intensive work when initializing the
//  default value. For example, if a view updates frequently, allocating a new default object
//  each time the view initializes can become expensive. Instead, you can defer the creation
//  of the object using the View/task(priority:_:) modifier."
//
// In this version of FeatureFactory, the view model is created inside a `.task` modifier and
// unwrapped inside a `ZStack`. While functional, this approach can cause visible flickering in
// certain situations, since the view briefly renders before the view model becomes available.
//
// See `FeatureFactoryV2` for an alternative implementation that uses a `lazy var` to avoid
// this issue.

struct FeatureFactoryV1<Input: Hashable, Content: View, ViewModel: Observable> {
    private struct RootView: View {
        @State private var viewModel: ViewModel?

        let input: Input
        let viewModelFactory: (Input) -> ViewModel
        let viewFactory: (ViewModel) -> Content

        var body: some View {
            ZStack {
                if let viewModel {
                    viewFactory(viewModel)
                }
            }
            .task {
                guard viewModel == nil else { return }
                viewModel = viewModelFactory(input)
            }
        }
    }

    static func view(
        input: Input,
        viewModelFactory: @escaping (Input) -> ViewModel,
        viewFactory: @escaping (ViewModel) -> Content
    ) -> some View {
        RootView(
            input: input,
            viewModelFactory: viewModelFactory,
            viewFactory: viewFactory
        ).id(input)
    }

    static func view(
        viewModelFactory: @escaping (Input) -> ViewModel,
        viewFactory: @escaping (ViewModel) -> Content
    ) -> some View where Input == String {
        view(
            input: "",
            viewModelFactory: viewModelFactory,
            viewFactory: viewFactory
        )
    }
}

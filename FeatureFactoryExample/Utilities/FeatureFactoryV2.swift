//
//  Created by Mikalai Zmachynski.
//  Copyright © 2026 Mikalai Zmachynski. All rights reserved.
//

import SwiftUI

// An improved version of `FeatureFactory` that uses a `lazy var` to access the view model.
// This avoids any delay in instantiating the view model, eliminating the flickering side
// effects present in the original implementation. However it introduces a small overhead
// by allocating extra ViewModelState class on every view update.

struct FeatureFactoryV2<Input: Hashable, Content: View, ViewModel: Observable> {
    private class ViewModelState {
        private let viewModelFactory: () -> ViewModel
        lazy var viewModel = viewModelFactory()

        init(_ viewModelFactory: @autoclosure @escaping () -> ViewModel) {
            self.viewModelFactory = viewModelFactory
        }
    }

    private struct RootView: View {
        @State private var state: ViewModelState

        let input: Input
        let viewFactory: (ViewModel) -> Content

        init(
            input: Input,
            viewModelFactory: @escaping (Input) -> ViewModel,
            viewFactory: @escaping (ViewModel) -> Content
        ) {
            self.input = input
            _state = State(initialValue: ViewModelState(viewModelFactory(input)))
            self.viewFactory = viewFactory
        }

        var body: some View {
            viewFactory(state.viewModel)
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

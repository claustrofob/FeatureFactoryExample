//
//  FeatureFactory.swift
//  FeatureFactoryExample
//
//  Created by Mikalai Zmachynski on 01/05/2026.
//

import SwiftUI

struct FeatureFactory<Input: Hashable, Content: View, ViewModel: Observable> {
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

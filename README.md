# FeatureFactoryExample

An example project demonstrating proper handling of view models in SwiftUI + MVVM architecture.

See the accompanying posts:

[Reddit](https://www.reddit.com/r/SwiftUI/comments/1t0q5h8/the_hidden_pitfall_of_state_var_viewmodel/)

[Linkedin](https://www.linkedin.com/pulse/hidden-pitfall-state-var-viewmodel-mikalai-zmachynski-bw1vf/)

In the [first version](https://github.com/claustrofob/FeatureFactoryExample/blob/main/FeatureFactoryExample/Utilities/FeatureFactoryV1.swift) of `FeatureFactory`, the view model is created inside a `.task` modifier and unwrapped inside a `ZStack`. While functional, this approach can cause visible flickering in certain situations, since the view briefly renders before the view model becomes available.

An improved [second version](https://github.com/claustrofob/FeatureFactoryExample/blob/main/FeatureFactoryExample/Utilities/FeatureFactoryV2.swift) uses a `lazy var` to access the view model. This avoids any delay in instantiating the view model, eliminating the flickering side effects present in the original implementation.

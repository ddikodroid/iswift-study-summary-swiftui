//
//  AnimationView.swift
//  iSwiftStudySummary
//
//  Created by Ahmad Syarifuddin Randiko on 09/12/22.
//

import SwiftUI

struct AnimationView: View {

    var body: some View {
        ScrollView {
            ScaleEffectAnimationView()
            LoadingIndicatorView()
            ProgressAnimationView()
            BubbleLoadingIndicatorView()
            ButtonAnimationView()
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}

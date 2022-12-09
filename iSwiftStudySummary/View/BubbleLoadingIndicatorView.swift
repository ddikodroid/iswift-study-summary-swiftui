//
//  BubbleLoadingIndicatorView.swift
//  iSwiftStudySummary
//
//  Created by Ahmad Syarifuddin Randiko on 09/12/22.
//

import SwiftUI

struct BubbleLoadingIndicatorView: View {
    @State private var isDotLoading = false
    var body: some View {
        HStack{
            ForEach(0...4, id: \.self){ item in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundStyle(.green.gradient)
                    .scaleEffect(isDotLoading ? 0 : 1)
                    .animation(.linear(duration: 0.6).repeatForever().delay(0.2 * Double(item)), value: isDotLoading)
            }
            .onAppear{
                isDotLoading = true
            }
        }
        .padding(.bottom, 16)
    }
}

struct BubbleLoadingIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleLoadingIndicatorView()
    }
}

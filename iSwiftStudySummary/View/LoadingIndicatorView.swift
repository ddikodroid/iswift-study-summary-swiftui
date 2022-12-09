//
//  LoadingIndicatorView.swift
//  iSwiftStudySummary
//
//  Created by Ahmad Syarifuddin Randiko on 09/12/22.
//

import SwiftUI

struct LoadingIndicatorView: View {
    @State private var isLoading = false
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color(.systemGray5), lineWidth:  16)
                .frame(width: 100, height: 100)
            
            Circle()
                .trim(from: 0, to: 0.25)
                .stroke(Color.purple, lineWidth: 8)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .onAppear{
                    withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)){
                        isLoading.toggle()
                    }
                }
        }
        .padding(.bottom, 16)
    }
}

struct LoadingIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicatorView()
    }
}

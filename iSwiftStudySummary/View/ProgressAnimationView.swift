//
//  ProgressAnimationView.swift
//  iSwiftStudySummary
//
//  Created by Ahmad Syarifuddin Randiko on 09/12/22.
//

import SwiftUI

struct ProgressAnimationView: View {
    @State private var progress: CGFloat = 0.0
    @State private var isLoadingProgress = false
    var body: some View {
        ZStack{
            Text("\(Int(progress*100))%")
            Circle()
                .stroke(Color(.systemGray5), lineWidth:  16)
                .frame(width: 100, height: 100)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(Color.purple, lineWidth: 8)
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: -90))
                .onAppear{
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){ timer in
                        progress += 0.05
                        if progress >= 1.0 {
                            timer.invalidate()
                        }
                    }
                }
        }.padding(.bottom, 16)
    }
}

struct ProgressAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressAnimationView()
    }
}

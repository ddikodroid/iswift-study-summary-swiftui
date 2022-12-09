//
//  ScaleEffectAnimationView.swift
//  iSwiftStudySummary
//
//  Created by Ahmad Syarifuddin Randiko on 09/12/22.
//

import SwiftUI

struct ScaleEffectAnimationView: View {
    @State private var circleColorChanged = false
    @State private var carColorChanged = false
    @State private var carSizeChanged = false
    
    let firstGradient = LinearGradient(colors: [Color.red, Color.yellow], startPoint: .center, endPoint: .bottomTrailing)
    let secondGradient = LinearGradient(colors: [Color.purple, Color.indigo], startPoint: .top, endPoint: .center)
    
    
    var body: some View {
        ZStack{
            Circle()
                .fill(circleColorChanged ? firstGradient: secondGradient)
                .frame(width: 160, height: 160)
                .animation(.easeIn, value: circleColorChanged)
            
            Image(systemName: "bolt.car.fill")
                .foregroundColor(carColorChanged ? .yellow : .white)
                .font(.system(size: 80))
                .scaleEffect(carSizeChanged ? 1.0 : 0.6)
                .animation(.easeIn, value: circleColorChanged)
        }
        .onTapGesture {
            carSizeChanged.toggle()
            carColorChanged.toggle()
            circleColorChanged.toggle()
        }
        .padding(.bottom, 16)
    }
}

struct ScaleEffectAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleEffectAnimationView()
    }
}

//
//  ButtonAnimationView.swift
//  iSwiftStudySummary
//
//  Created by Ahmad Syarifuddin Randiko on 09/12/22.
//

import SwiftUI

struct ButtonAnimationView: View {
    @State private var isStop = false
    @State private var isPlay = false
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: isStop ? 32 : 6)
                    .frame(width: isStop ? 60 : 240, height: 60)
                    .foregroundStyle(isStop ? Color.blue.gradient : Color.purple.gradient)
                    .overlay {
                        Image(systemName: "mic.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .scaleEffect(isPlay ? 0.7 : 1)
                    }
                RoundedRectangle(cornerRadius: isStop ? 36 : 12)
                    .trim(from: 0, to: isStop ? 0.001 : 1)
                    .stroke(lineWidth: 6)
                    .frame(width: isStop ? 72 : 254, height: 72)
                    .foregroundColor(.purple)
            }
            .padding(.bottom, 8)
            .onTapGesture {
                withAnimation(Animation.spring()){
                    isStop.toggle()
                }
                withAnimation(Animation.spring().repeatForever().delay(0.5)){
                    isPlay.toggle()
                }
            }
            if isStop {
                Text("Recording...")
                    .animation(Animation.easeIn, value: isPlay)
            }
        }
    }
}

struct ButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAnimationView()
    }
}

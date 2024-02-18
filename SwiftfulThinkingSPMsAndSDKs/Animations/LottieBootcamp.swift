//
//  LottieBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Nick Sarno on 2/11/24.
//

import SwiftUI
import Lottie

// .json <- OLD
// .dotLottie <- NEW

struct LottieHelperView: View {
    
    var fileName: String = "StarAnimation.json"
    var contentMode: UIView.ContentMode = .scaleAspectFill
    var playLoopMode: LottieLoopMode = .playOnce
    var onAnimationDidFinish: (() -> Void)? = nil
    
    var body: some View {
        LottieView(animation: .named(fileName))
            .configure({ lottieAnimationView in
                lottieAnimationView.contentMode = contentMode
//                lottieAnimationView.shouldRasterizeWhenIdle = true
            })
            .playbackMode(.playing(.toProgress(1, loopMode: playLoopMode)))
            .animationDidFinish { completed in
                onAnimationDidFinish?()
            }
    }
}

#Preview {
    LottieHelperView()
}

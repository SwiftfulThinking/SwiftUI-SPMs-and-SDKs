//
//  KingfisherBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Nick Sarno on 2/9/24.
//

import SwiftUI
import Kingfisher

struct KingfisherImageLoader: View {
    
    let url: String
    var contentMode: SwiftUI.ContentMode = .fill

    var body: some View {
        KFImage(URL(string: url))
            .placeholder {
                Color.red
            }
            .resizable()
            .onProgress({ receivedSize, totalSize in
                
            })
            .onSuccess({ result in
                
            })
            .onFailure({ error in
                
            })
            //.setProcessor(T##processor: ImageProcessor##ImageProcessor)
            //.cacheMemoryOnly()
            //.lowDataModeSource(.network(lowResolutionURL))
            .aspectRatio(contentMode: contentMode)
    }
}

#Preview {
    KingfisherImageLoader(
        url: "https://picsum.photos/id/237/200/300",
        contentMode: .fill
    )
    .frame(width: 200, height: 200)
}

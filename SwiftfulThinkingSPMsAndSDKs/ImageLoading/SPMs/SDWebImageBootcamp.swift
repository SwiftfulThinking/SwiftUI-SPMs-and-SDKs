//
//  SDWebImageBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Nick Sarno on 2/9/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SDWebImageLoader: View {
    
    let url: String
    var contentMode: ContentMode = .fill
    
    var body: some View {
        WebImage(url: URL(string: url))
            .onSuccess(perform: { image, data, cacheType in
                //
            })
            .onFailure(perform: { error in
                //
            })
            //.placeholder(Image(systemName: "photo"))
            .placeholder(content: {
                Color.gray.opacity(0.3)
            })
            .resizable()
//            .indicator(.activity)
            .aspectRatio(contentMode: contentMode)
    }
}

struct SDWebImageBootcamp: View {
    
    var body: some View {
        ImageLoader(
            url: "https://picsum.photos/id/237/200/300",
            contentMode: .fill
        )
        .frame(width: 100, height: 300)
        .onAppear {
            // ImagePrefetcher.instance.startPrefetching(urls: <#T##[URL]#>)
        }
    }
}

#Preview {
    SDWebImageBootcamp()
}

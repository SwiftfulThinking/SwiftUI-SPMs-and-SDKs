//
//  SwiftfulRoutingBootcamp.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Nick Sarno on 2/11/24.
//

import SwiftUI
import SwiftfulRouting

struct SwiftfulRoutingBootcamp: View {
    var body: some View {
        RouterView { router in
            MyHomeView(viewModel: MyHomeViewModel(router: router))
//            Text("View1")
//                .onTapGesture {
//                    router.showScreen(.sheet) { router2 in
//                        Text("View2")
//                            .onTapGesture {
//                                router2.showScreen(.fullScreenCover) { router3 in
//                                    Text("View3")
//                                        .onTapGesture {
//                                            router3.showScreen(.push) { router4 in
//                                                Text("View4")
//                                                    .onTapGesture {
//                                                        router4.dismissScreen()
//                                                    }
//                                            }
//                                        }
//                                }
//                            }
//                    }
//                }
        }
    }
}

final class MyHomeViewModel: ObservableObject {
    
    let router: AnyRouter

    init(router: AnyRouter) {
        self.router = router
    }
    
    func goToNextScreen() {
//        router.showScreen(.push) { router in
//            MyThirdScreen(router: router)
//        }
        let route1 = AnyRoute(.fullScreenCover, destination: { router in
             Text("View1")
                .onTapGesture {
                    try? router.showNextScreen()
                }
        })
        let route2 = AnyRoute(.push, destination: { router in
             Text("View2")
                .onTapGesture {
                    try? router.showNextScreen()
                }
        })
        let route3 = AnyRoute(.push, destination: { router in
             Text("View3")
                .onTapGesture {
//                    do {
//                        try router.showNextScreen()
//                    } catch {
//                        router.dismissEnvironment()
//                    }
                    router.showNextScreenOrDismissEnvironment()
                }
//                .onTapGesture {
//                    router.dismissScreenStack()
//                }
        })
                                
        //router.pushScreenStack(destinations: [route1, route2, route3])
        
        router.enterScreenFlow([
            route1, route2, route3
        ])
    }
}

struct MyHomeView: View {
    
    @Environment(\.router) var router
//    let router: AnyRouter
    @StateObject var viewModel: MyHomeViewModel
    
    let route: AnyRoute = AnyRoute(.push) { router in
        MyThirdScreen(router: router)
    }

    var body: some View {
        Button("CLICK ME", action: {
            viewModel.goToNextScreen()
            
        })
            .navigationTitle("Home")
    }
}

struct MyThirdScreen: View {
    
    //@Environment(\.router) var router
    let router: AnyRouter

    var body: some View {
        Button("CLICK ME", action: {
            router.dismissScreen()
        })
        .navigationTitle("SCREEN 3")
    }
}

#Preview {
    SwiftfulRoutingBootcamp()
}

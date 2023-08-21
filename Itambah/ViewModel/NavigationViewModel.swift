//
//  NavigationViewModel.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 20/08/23.
//

import Foundation
import SwiftUI

enum Destination: Hashable {
    case homeView
    case instructionView
    case mainView
}

class Router: ObservableObject {
    @Published var path = NavigationPath()
    
    // example function inside router
    func popToRoot() {
        path.removeLast(path.count)
    }
}

class ViewFactory {
    @ViewBuilder
    static func viewForDestination(_ destination: Destination) -> some View {
        switch destination {
        case .homeView:
            HomeView()
        case .instructionView:
            InstructionView()
        case .mainView:
            MainView()
        }
    }
}

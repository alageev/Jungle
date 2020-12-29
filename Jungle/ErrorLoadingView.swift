//
//  ErrorLoadingView.swift
//  Jungle
//
//  Created by Алексей Агеев on 30.12.2020.
//

import SwiftUI

struct ErrorLoadingView: View {
    
    @ObservedObject var dataLoader: DataLoader
    
    var body: some View {
        VStack {
            Text("error_loading_text")
            Button(action: { dataLoader.load() },
                   label: { Text("try_load") })
        }
    }
}

struct ErrorLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorLoadingView(dataLoader: DataLoader())
//        EmptyView()
    }
}

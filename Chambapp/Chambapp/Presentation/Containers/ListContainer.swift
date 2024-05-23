//
//  ListContainer.swift
//  Chambapp
//
//  Created by Fabian Rodriguez on 22/5/24.
//

import SwiftUI

struct ListContainer<Content: View>: View {
    
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        List(content: content)
            //.font(.montserrat())
            .foregroundColor(Color.listRowForeground)
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background(RadialGradient(colors: [Color.backgroundTop,
                                        Color.background],
                                       center: .top,
                                       startRadius: .zero,
                                       endRadius: ConstantColors.endRadiusBackground))
    }
}

#Preview {
    ListContainer {
        Text("Inside list container")
            .listRowBackground(Color.listRowBackground)
    }
}

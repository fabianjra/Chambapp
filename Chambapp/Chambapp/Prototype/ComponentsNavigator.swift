//
//  ComponentsNavigator.swift
//  Chambapp
//
//  Created by Fabian Rodriguez on 22/5/24.
//

import SwiftUI

struct ComponentsNavigator: View {
    var body: some View {
        
        ListContainer {
            SectionContainer(header: "Login") {
                
                Button("Log out") {
                    print("Logged out")
                }
                .foregroundColor(Color.warning)
                .font(.montserrat(.semibold))
            }
        }
    }
}

#Preview {
    ComponentsNavigator()
}

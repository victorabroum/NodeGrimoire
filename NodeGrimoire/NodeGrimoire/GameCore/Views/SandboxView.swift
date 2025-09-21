//
//  SandboxView.swift
//  NodeGrimoire
//
//  Created by Victor Vasconcelos on 20/09/25.
//

import SwiftUI
import SpriteKit

struct SandboxView: View {
    var body: some View {
        SpriteView(scene: SandboxScene.create(), debugOptions: .debugOptions)
    }
}

#Preview {
    SandboxView()
}

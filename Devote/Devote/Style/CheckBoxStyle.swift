//
//  CheckBoxStyle.swift
//  Devote
//
//  Created by Erasmo J.F Da Silva on 27/07/21.
//  SwiftUI ♡ Better Apps. Less Code
//  https://erasmojf.github.io/
//  Fidju de Bideira de Feira de Caracol

import SwiftUI

struct CheckBoxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                    if configuration.isOn {
                        playeSound(sound: "sound-rise", type: "mp3")
                    } else {
                        playeSound(sound: "sound-tap", type: "mp3")
                        feedback.notificationOccurred(.success)
                    }
                }
            configuration.label
        }//HStack
    }
}

// MARK: - PREVIEW

struct CheckBoxStyle_Previews: PreviewProvider {
    static var previews: some View {
        Toggle("Placeholder", isOn: .constant(false))
            .toggleStyle(CheckBoxStyle())
            .padding()
            .previewLayout(.sizeThatFits)
            
    }
}

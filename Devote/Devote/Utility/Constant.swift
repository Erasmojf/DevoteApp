//
//  Constant.swift
//  Devote
//
//  Created by Erasmo J.F Da Silva on 23/07/21.
//  SwiftUI ♡ Better Apps. Less Code
//  https://erasmojf.github.io/
//  Fidju de Bideira de Feira de Caracol

import SwiftUI


// MARK: - FORMATTER

 let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()


// MARK: - UI
var backgroundGradient: LinearGradient {
    return LinearGradient(
        gradient:
            Gradient(
                colors: [Color.pink, Color.blue]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing)
}
// MARK: - UX

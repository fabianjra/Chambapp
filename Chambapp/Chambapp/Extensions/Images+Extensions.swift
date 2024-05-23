//
//  Images+Extensions.swift
//  Chambapp
//
//  Created by Fabian Rodriguez on 22/5/24.
//

import SwiftUI

extension Image {
    
    // MARK: BUTTON
    static let plus = Image(systemName: "plus")
    
    // MARK: TEXFIELD
    static let envelopeFill = Image(systemName: "envelope.fill") //Email
    static let lockFill = Image(systemName: "lock.fill") //Password
    static let personFill = Image(systemName: "person.fill") //Name
    static let checkmark = Image(systemName: "checkmark") //Password confirmation
    static let calendar = Image(systemName: "calendar") //Date
    
    // MARK: TABVIEW
    static let dolarSquare = Image(systemName: "dollarsign.square") //Resume
    static let dolarSquareFill = Image(systemName: "dollarsign.square.fill")
    static let stack = Image(systemName: "mail.stack") //History
    static let stackFill = Image(systemName: "mail.stack.fill")
    static let sliderHorizontal = Image(systemName: "slider.horizontal.3") //Settings
    
    // MARK: LIST
    static let listBulletClipboard = Image(systemName: "list.bullet.clipboard") //Categories
    static let listBulletClipboardFill = Image(systemName: "list.bullet.clipboard.fill")
    
    // MARK: NAVIGATION
    static let arrowRight = Image(systemName: "arrow.right")
    static let arrowBackward = Image(systemName: "arrow.backward")
    static let chevronLeft = Image(systemName: "chevron.left")
    
    // MARK: GENERAL
    static let warningFill = Image(systemName: "exclamationmark.triangle.fill")
    static let arrowTurnUpLeft = Image(systemName: "arrowshape.turn.up.left")
    static let arrowTurnUpLeftFill = Image(systemName: "arrowshape.turn.up.left.fill")
    
    // MARK: FUNCTIONS
    static func imageSelected(_ condition: Bool, imageSelected: Image, imageDeselected: Image) -> Image {
        if condition {
            return imageSelected.resizable()
        } else {
            return imageDeselected.resizable()
        }
    }
}

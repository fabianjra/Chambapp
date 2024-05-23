//
//  TextFieldIconStyle.swift
//  Chambapp
//
//  Created by Fabian Rodriguez on 22/5/24.
//

import SwiftUI

struct TextFieldIconStyle: TextFieldStyle {
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    @Binding private var text: String
    private let family: Font.Family
    private let size: Font.Sizes
    private let iconLeading: Image?
    private let textLimit: Int
    
    private let foregroundColor: Color
    private let backgroundColor: Color
    
    @Binding private var isError: Bool
    
    private var showFocusedIndicador: Bool
    @FocusState private var isFocused: Bool
    
    public init(_ text: Binding<String>,
                family: Font.Family = .regular,
                size: Font.Sizes = .body,
                iconLeading: Image? = nil,
                textLimit: Int = ConstantViews.textLimitGeneral,
                foregroundColor: Color = Color.textFieldForeground,
                backgroundColor: Color = Color.textFieldBackground,
                isError: Binding<Bool> = .constant(false),
                showFocusedIndicador: Bool = true) {
        
        self._text = text
        self.family = family
        self.size = size
        self.iconLeading = iconLeading
        self.textLimit = textLimit
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self._isError = isError
        self.showFocusedIndicador = showFocusedIndicador
    }
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            if let iconLeading = iconLeading {
                iconLeading
                    .frame(width: ConstantFrames.textFieldHeight, height: ConstantFrames.textFieldHeight)
                    .background(Color.textFieldIconBackground)
            }
            
            configuration
                .frame(height: ConstantFrames.textFieldHeight)
                //.background(.green) //TODO: For testing
                .padding(.horizontal, iconLeading == nil ? nil : .zero)
                .padding(.trailing, iconLeading != nil ? nil : .zero)
                .font(.montserrat(family, size: size))
                .focused($isFocused)
                .onChange(of: text, {
                    
                    if text.isEmpty {
                        isError = true
                    } else {
                        isError = false
                    }
                    
                    //Validate the limit character count.
                    if text.count > textLimit {
                        text = String(text.prefix(textLimit))
                    }
                })
        }
        .foregroundColor(foregroundColor)
        
        //if apply disabled background, all textfield will change to gray when a view is loading.
        //.background(isEnabled ? backgroundColor : Color.disabledBackground)
        .background(backgroundColor)
        .cornerRadius(.infinity)
        .overlay {
            if showFocusedIndicador {
                if isFocused {
                    RoundedRectangle(cornerRadius: .infinity)
                        .stroke(LinearGradient(
                            colors: Color.primaryGradiant,
                            startPoint: .leading,
                            endPoint: .trailing), lineWidth: ConstantShapes.textFieldLineWidth)
                }
            }
            
            if isError {
                RoundedRectangle(cornerRadius: .infinity)
                    .stroke(LinearGradient(
                        colors: [Color.warning],
                        startPoint: .leading,
                        endPoint: .trailing), lineWidth: ConstantShapes.textFieldLineWidth)
            }
        }
    }
}

#Preview {
    VStack {
        
        @State var text = ""
        
        //Nothing:
        TextField("", text: $text)
            .textFieldStyle(TextFieldIconStyle($text, isError: .constant(false)))
        
        //iOS Placeholder
        TextField("iOS placeholder", text: $text)
            .textFieldStyle(TextFieldIconStyle($text, isError: .constant(false)))
            .disabled(true)
        
        //With placeholder and icon, With error
        TextField("", text: $text, prompt:
                    Text("With placeholder and icon").foregroundColor(.textFieldPlaceholder))
            .textFieldStyle(TextFieldIconStyle($text, iconLeading: Image.envelopeFill, isError: .constant(true)))
        
        //Nothing X2
        TextField("", text: $text)
            .textFieldStyle(TextFieldIconStyle($text, isError: .constant(false)))
        
        //Only icon
        TextField("", text: .constant("This textfield is disabled"))
            .textFieldStyle(TextFieldIconStyle($text, iconLeading: Image.envelopeFill, isError: .constant(false)))
            .disabled(true)
        
        //Only icon X2
        TextField("", text: $text)
            .textFieldStyle(TextFieldIconStyle($text, iconLeading: Image.lockFill, isError: .constant(false)))
    }
    .padding()
    .background(Color.background)
}

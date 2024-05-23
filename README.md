# ChambApp: Version for iOS

Chambapp es una app que te ayuda a encontrar trabajo y buscar trabajadores.


<p>&nbsp;</p>


## Binding example:

```
struct TextFieldIconStyle: TextFieldStyle {
    
    @Binding private var text: String
    private let size: CGFloat
    
    public init(_ text: Binding<String>, size: CGFloat = FontSizes.body) {
        self._text = text
        self.size = size
    }
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        HStack {
            configuration
                .frame(height: Frames.textFieldHeight)
                .paddig()
        }
    }
}

struct TextFieldIconStyle_Previews: PreviewProvider {
    static var previews: some View {
        
        @State var text = ""

        TextField("", text: $text)
            .textFieldStyle(TextFieldIconStyle($text))
    }
}

```

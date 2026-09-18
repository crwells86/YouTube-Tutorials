import SwiftUI

struct ContentView: View {
    
    /// Adds an action to perform when the hinge context of the
    /// view hierarchy changes.
    ///
    /// Use this modifier to be informed of changes to the hinge
    /// context of the device.
    
    @State private var hinge: DeviceHinge? = nil
    
    var body: some View {
        VStack {
            if let hinge {
                AngleDisplayView(angle: hinge.angle)
                StatusDisplayView(status: hinge.status)
            } else {
                ContentUnavailableView(
                    "Hinge Unavailable",
                    systemImage: "rectangle.split.2x1")
            }
        }
        .onHingeChange { _, newContext in
            hinge = newContext.hinge
        }
    }
    
    /// In the example above, the current angle and status of the hinge
    /// will be displayed in the app as you interact with the hinge.
}

#Preview {
    ContentView()
}

import SwiftUI

// MARK: - AngleDisplayView
struct AngleDisplayView: View {
    let angle: Angle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Hinge Angle", systemImage: "angle")
                .font(.headline)
            Text(String(format: "%.1f°", angle.degrees))
                .font(.system(size: 48, weight: .bold, design: .rounded))
                .monospacedDigit()
                .accessibilityLabel("Hinge angle")
                .accessibilityValue("\(Int(angle.degrees.rounded())) degrees")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

// MARK: - StatusDisplayView
struct StatusDisplayView<StatusType>: View {
    let status: StatusType
    var formatter: (StatusType) -> String = { String(describing: $0) }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label("Hinge Status", systemImage: "rectangle.split.2x1")
                .font(.headline)
            Text(formatter(status))
                .font(.title2.weight(.semibold))
                .accessibilityLabel("Hinge status")
                .accessibilityValue(formatter(status))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

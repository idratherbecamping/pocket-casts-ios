import SwiftUI
import WidgetKit

extension View {
    @ViewBuilder
    func backwardWidgetAccentable(_ accentable: Bool = true) -> some View {
        if #available(iOS 16.0, *) {
            self.widgetAccentable(accentable)
        } else {
            self
        }
    }
}

extension Image {
    @ViewBuilder
    func backwardWidgetAccentedRenderingMode(_ isAccentedRenderingMode: Bool = true) -> some View {
        if isAccentedRenderingMode {
            self.renderingMode(.template)
                .foregroundColor(.accentColor)
        } else {
            self.renderingMode(.original)
        }
    }

    @ViewBuilder
    func backwardWidgetAccentedDesaturatedRenderingMode() -> some View {
        self.renderingMode(.template)
            .foregroundColor(.accentColor)
            .saturation(0.5)
    }

    @ViewBuilder
    func backwardWidgetFullColorRenderingMode() -> some View {
        backwardWidgetAccentedRenderingMode(false)
    }

    func accentable() -> some View {
        self.renderingMode(.template)
            .foregroundColor(.accentColor)
    }
}

extension EnvironmentValues {
    var isAccentedRenderingMode: Bool {
        get {
            if #available(iOS 16.0, *) {
                widgetRenderingMode == .accented
            }
            else {
                self[AccentedWidgetKey.self]
            }
        }
    }
}

private enum AccentedWidgetKey: EnvironmentKey {
    static let defaultValue = false
}

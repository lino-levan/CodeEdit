//
//  TerminalThemeView.swift
//  
//
//  Created by Lukas Pistrol on 31.03.22.
//

import SwiftUI
import FontPicker

struct TerminalThemeView: View {
    @StateObject
    private var prefs: AppPreferencesModel = .shared

    @StateObject
    private var themeModel: ThemeModel = .shared

    init() {}

    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .foregroundColor(Color(NSColor.controlBackgroundColor))
            VStack(alignment: .leading, spacing: 15) {
                topToggles
                colorSelector
                ansiColorSelector
            }
            .padding(20)
        }
    }

    private var topToggles: some View {
        VStack(alignment: .leading) {
            Toggle("Always use dark terminal appearance", isOn: $prefs.preferences.terminal.darkAppearance)
        }
    }

    private var colorSelector: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Background & Text")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
            HStack(alignment: .top, spacing: 0) {
                if let selectedTheme = themeModel.selectedTheme,
                   let index = themeModel.themes.firstIndex(of: selectedTheme) {
                    VStack(alignment: .leading, spacing: 10) {
                        PreferencesColorPicker($themeModel.themes[index].terminal.text.swiftColor,
                                               label: "Text")
                        PreferencesColorPicker($themeModel.themes[index].terminal.boldText.swiftColor,
                                               label: "Bold Text")
                        PreferencesColorPicker($themeModel.themes[index].terminal.cursor.swiftColor,
                                               label: "Cursor")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(alignment: .leading, spacing: 10) {
                        PreferencesColorPicker($themeModel.themes[index].terminal.background.swiftColor,
                                               label: "Background")
                        PreferencesColorPicker($themeModel.themes[index].terminal.selection.swiftColor,
                                               label: "Selection")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }

    private var ansiColorSelector: some View {
        VStack(alignment: .leading, spacing: 5) {
            if let selectedTheme = themeModel.selectedTheme,
               let index = themeModel.themes.firstIndex(of: selectedTheme) {
                Text("ANSI Colors")
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.secondary)
                    .padding(.bottom, 5)
                HStack(spacing: 5) {
                    PreferencesColorPicker($themeModel.themes[index].terminal.black.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.red.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.green.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.yellow.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.blue.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.magenta.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.cyan.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.white.swiftColor)
                    Text("Normal").padding(.leading, 4)
                }
                HStack(spacing: 5) {
                    PreferencesColorPicker($themeModel.themes[index].terminal.brightBlack.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.brightRed.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.brightGreen.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.brightYellow.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.brightBlue.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.brightMagenta.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.brightCyan.swiftColor)
                    PreferencesColorPicker($themeModel.themes[index].terminal.brightWhite.swiftColor)
                    Text("Bright").padding(.leading, 4)
                }
                .padding(.top, 5)
            }
        }
    }
}

struct TerminalThemeView_Previews: PreviewProvider {
    static var previews: some View {
        TerminalThemeView()
            .preferredColorScheme(.dark)
    }
}

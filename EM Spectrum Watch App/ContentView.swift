//
//  ContentView.swift
//  EM Spectrum Watch App
//
//  Created by Joshua Peisach on 10/20/23.
//

import SwiftUI

struct WaveView: View {
    @State private var crownValue = 0.0

    var body: some View {
        VStack {
            // Let the crownValue represent the exponent (10 raised to the x)
            // This gives us easy numbers to deal with
            let wavelength = NSDecimalNumber(value: pow(10, crownValue))
            var formattedWavelength: String {
                let formatter = NumberFormatter()
                formatter.numberStyle = .scientific
                formatter.usesSignificantDigits = true
                formatter.maximumSignificantDigits = 3

                let formattedValue = formatter.string(from: wavelength)
                return "Wavelength: \(formattedValue.unsafelyUnwrapped) m"
            }
            Text(formattedWavelength).focusable().digitalCrownRotation($crownValue, from: -16.0, through: 3.0, sensitivity: .low).fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)

            // TODO: there's probably a way to do the formatting without neding another formattedValue var
            let frequency = NSDecimalNumber(value: pow(3, 8) / pow(10, crownValue))
            var formattedFrequency: String {
                let formatter = NumberFormatter()
                formatter.numberStyle = .scientific
                formatter.usesSignificantDigits = true
                formatter.minimumSignificantDigits = 3
                formatter.maximumSignificantDigits = 3

                let formattedValue = formatter.string(from: frequency)
                return "Frequency: \(formattedValue.unsafelyUnwrapped) Hz"
            }
            Text(formattedFrequency).fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)

            // TODO: check these values
            if(crownValue < -11) {
                Text("Gamma Ray")
            }
            else if(crownValue > -11 && crownValue < -8) {
                Text("X Ray")
            }
            else if(crownValue > -8 && crownValue < -7) {
                Text("Ultraviolet Light")
            }
            else if(crownValue > -7 && crownValue < -6) {
                // TODO: Show the color
                Text("Visible Light")
            }
            else if(crownValue > -6 && crownValue < -3) {
                Text("Infrared Wave")
            } else if(crownValue > -3 && crownValue < 3) {
                Text("Microwave")
            }
            else if(crownValue > 3) {
                Text("Radio Wave")
            }
        }
        .padding()
    }
}

#Preview {
    WaveView()
}

//
//  ContentView.swift
//  EM Spectrum Watch App
//
//  Created by Joshua Peisach on 10/20/23.
//

import SwiftUI

struct WaveView: View {
    @State private var crownValue = 0.0

    private func format(value: NSNumber) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.usesSignificantDigits = true
        formatter.maximumSignificantDigits = 3

        return formatter.string(from: value).unsafelyUnwrapped
    }

    var body: some View {
        VStack {
            // Let the crownValue represent the exponent (10 raised to the x)
            // This gives us easy numbers to deal with
            let wavelength = NSDecimalNumber(value: pow(10, crownValue))
        
            // TODO: check these values, find a better way to do this
            if(crownValue < -11) {
                Text("Gamma Ray").dynamicTypeSize(.xxxLarge)
            }
            else if(crownValue > -11 && crownValue < -8) {
                Text("X Ray").dynamicTypeSize(.xxxLarge)
            }
            else if(crownValue > -8 && crownValue < -7) {
                Text("Ultraviolet Light").dynamicTypeSize(.xxxLarge)
            }
            else if(crownValue > -7 && crownValue < -6) {
                // TODO: Show the color
                Text("Visible Light").dynamicTypeSize(.xxxLarge)
            }
            else if(crownValue > -6 && crownValue < -3) {
                Text("Infrared Wave").dynamicTypeSize(.xxxLarge)
            } else if(crownValue > -3 && crownValue < 3) {
                Text("Microwave").dynamicTypeSize(.xxxLarge)
            }
            else if(crownValue > 3) {
                Text("Radio Wave").dynamicTypeSize(.xxxLarge)
            }

            Text("Wavelength: " + format(value: wavelength) + " m").focusable().digitalCrownRotation($crownValue, from: -16.0, through: 3.0, sensitivity: .low).fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)

            let frequency = NSDecimalNumber(value: (3 * pow(10, 8)) / pow(10, crownValue))
            Text("Frequency: " + format(value: frequency) + " Hz").fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: false)

            let photonEnergy = NSDecimalNumber(value: (6.63 * pow(10, -34)) * frequency.doubleValue)
            Text("Photon Energy: " + format(value: photonEnergy) + " J").fixedSize(horizontal: true, vertical: false).dynamicTypeSize(.xSmall)
        }
        .padding()
    }
}

#Preview {
    WaveView()
}

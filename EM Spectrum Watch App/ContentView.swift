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
            // TODO: show this in scientific notation
            Text("Wavelength: \(pow(10, crownValue), specifier: "%.16f") m").focusable().digitalCrownRotation($crownValue, from: -16.0, through: 3.0, sensitivity: .low)

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
            else if(crownValue > -7 && crownValue < -3) {
                Text("Infrared Wave")
            } else if(crownValue > -3) {
                Text("Radio Wave")
            }
        }
        .padding()
    }
}

#Preview {
    WaveView()
}

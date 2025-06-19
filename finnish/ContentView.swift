//
//  ContentView.swift
//  finnish
//
//  Created by Myriam Anderson on 6/19/25.
//
// MARK: - Main View
import SwiftUI

// MARK: - ContentView (Main Menu)
struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Spacer()
                    .frame(height: 10)
                Text("Learn Finnish!")
                    .font(.system(size: 40, weight: .bold))
                    .multilineTextAlignment(.center)
                    . foregroundColor(.white)

                Spacer()
                    .frame(height: 10)
                NavigationLink(destination: FinnishGrammarMenuView()) {
                    Text("Finnish Grammar")
                        .font(.system(size: 20, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 0.1, green: 0.2, blue: 0.4).opacity(0.8))
                NavigationLink(destination: GrammarPracticeView()) {
                    Text("Grammar Practice")
                        .font(.system(size: 20, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 0.1, green: 0.2, blue: 0.4).opacity(0.81))
                NavigationLink(destination: VocabFlashcardsMenuView()) {
                    Text("Vocab Flashcards")
                        .font(.system(size: 20, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 0.1, green: 0.2, blue: 0.4).opacity(0.82))

                Spacer()
            }
            .padding()
            .background(
                Image("Finland")
                    .resizable() // Makes the image resizable
                    .scaledToFill() // Scales the image to fill the background
                    .ignoresSafeArea(.all) // Extends the image to ignore safe area insets
                    .offset(x: -50)
            )
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

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
                Text("Learn Finnish!")
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)

                NavigationLink(destination: FinnishGrammarMenuView()) {
                    Text("Finnish Grammar")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)

                NavigationLink(destination: GrammarPracticeView()) {
                    Text("Grammar Practice")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)

                NavigationLink(destination: VocabFlashcardsMenuView()) {
                    Text("Vocab Flashcards")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}

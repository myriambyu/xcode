//
//  VocabFlashcardsMenuView.swift
//  finnish
//
//  Created by Myriam Anderson on 6/19/25.
//
import SwiftUI

struct VocabFlashcardsMenuView: View {
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: CSVFlashcardView()) {
                Text("Verbs 1")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .navigationTitle("Vocab Flashcards")
    }
}
// MARK: - Flashcard Data Model
struct Flashcard: Identifiable {
    let id = UUID()
    let question: String
    let answer: String
}

// MARK: - CSV Loader
func loadFlashcards(fromCSV fileName: String) -> [Flashcard] {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "csv"),
          let content = try? String(contentsOf: url, encoding: .utf8) else {
        return []
    }
    
    let lines = content.components(separatedBy: .newlines)
    var flashcards: [Flashcard] = []
    
    for line in lines.dropFirst() {
        let columns = line.components(separatedBy: ",")
        if columns.count == 2 {
            flashcards.append(Flashcard(
                question: columns[0].trimmingCharacters(in: .whitespaces),
                answer: columns[1].trimmingCharacters(in: .whitespaces)
            ))
        }
    }
    
    return flashcards
}

// MARK: - CSV Flashcard Flip View
struct CSVFlashcardView: View {
    let flashcards = loadFlashcards(fromCSV: "flashcards")
    @State private var currentIndex = 0
    @State private var isFlipped = false
    
    var body: some View {
        VStack(spacing: 20) {
                if flashcards.indices.contains(currentIndex) {
                    let card = flashcards[currentIndex]
                    
                    // 🔢 Card position indicator
                    Text("\(currentIndex + 1)/\(flashcards.count)")
                        .font(.headline)
                        .foregroundColor(.gray)

                    // 🃏 Flashcard
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.blue.opacity(0.2))
                            .frame(height: 250)
                            .shadow(radius: 5)
                            .overlay(
                                ZStack {
                                    if isFlipped {
                                        Text(card.answer)
                                            .font(.system(size: 40, weight: .semibold))
                                            .multilineTextAlignment(.center)
                                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                                    } else {
                                        Text(card.question)
                                            .font(.system(size: 40, weight: .semibold))
                                            .multilineTextAlignment(.center)
                                    }
                                }
                                .padding()
                            )
                            .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                    }
                    .onTapGesture {
                        isFlipped.toggle()
                    }
                    .padding()

                    // Navigation Buttons
                    HStack {
                        Button("Previous") {
                            if currentIndex > 0 {
                                currentIndex -= 1
                                isFlipped = false
                            }
                        }
                        .disabled(currentIndex == 0)

                        Spacer()

                        Button("Next") {
                            if currentIndex < flashcards.count - 1 {
                                currentIndex += 1
                                isFlipped = false
                            }
                        }
                        .disabled(currentIndex == flashcards.count - 1)
                    }
                    .padding(.horizontal)
                    .buttonStyle(.bordered)
                } else {
                    Text("No flashcards found.")
                }
            }
        .navigationTitle("Flashcards")
        .padding()
    }
}


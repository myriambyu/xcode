//
//  FinnishGrammarMenuView.swift
//  finnish
//
//  Created by Myriam Anderson on 6/19/25.
//
import SwiftUI

struct FinnishGrammarMenuView: View {
    var body: some View {
        VStack(spacing: 20) {
            NavigationLink(destination: LearnView(verbs: sampleVerbs)) {
                Text("Learn Verb Rules")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
        .navigationTitle("Finnish Grammar")
    }
}

// MARK: - Verb Data Model
struct Verb: Identifiable {
    let id = UUID()
    let infinitive: String
    let ending: String
    let explanation: String
    let stem: String
}

let sampleVerbs: [Verb] = [
    Verb(infinitive: "puhua", ending: "Va", explanation: "-a: \t\t puhua → puhu-", stem: "puhu"),
    Verb(infinitive: "juoda", ending: "da", explanation: "-da: \t\t juoda → juo-", stem: "juo"),
    Verb(infinitive: "tulla", ending: "CCa", explanation: "-Ca +e: \t tulla → tule-", stem: "tule"),
    Verb(infinitive: "haluta", ending: "Type 4", explanation: "-t: \t\t haluta → halua-", stem: "halua"),
    Verb(infinitive: "tarvita", ending: "Type 5", explanation: "-a +se: \t tarvita → tarvitse-", stem: "tarvitse")
]
// MARK: - Learn View
struct LearnView: View {
    let verbs: [Verb]
    
    var body: some View {
        List(verbs) { verb in
            VStack(alignment: .leading) {
                Text("🔹 \(verb.infinitive)")
                    .font(.headline)
                Text("Ending: \(verb.ending)")
                    .foregroundStyle(.secondary)
                Text("Rule: \(verb.explanation)")
                    .padding(.top, 2)
            }
            .padding(.vertical, 6)
        }
        .navigationTitle("Verb Rules")
    }
}


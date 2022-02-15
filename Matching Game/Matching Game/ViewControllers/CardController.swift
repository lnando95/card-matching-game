import Foundation
// step 1. remove isFlip from card
// step 2. instead of isFlip reference cardGame.matches and cardGame firstFaceupCard and secondFaceUpCard
class CardGame: ObservableObject {
    var cards: [Card]
    @Published var matches: [Card] = []
    @Published var firstFaceUpCard: Card?
    @Published var secondFaceUpCard: Card?
    @Published var numberOfGuesses = 0
    func flipCard(card: Card) {
        numberOfGuesses += 1
        if firstFaceUpCard != nil && secondFaceUpCard != nil {
            // this is the third card tapped, unlflips the first two cards.
            firstFaceUpCard = nil
            secondFaceUpCard = nil
        }
        // this function will handle flipping the card and unflipping after a second
        if firstFaceUpCard == nil {
            firstFaceUpCard = card
        } else {
            secondFaceUpCard = card
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.updateMatches()
            }
        }
    }
    func cardIsFlipped(card: Card) -> Bool {
        return matches.contains { currentCard in
            card.id == currentCard.id
        } || firstFaceUpCard?.id == card.id || secondFaceUpCard?.id == card.id
    }
    func updateMatches() {
        guard let firstFaceUpCard = firstFaceUpCard, let secondFaceUpCard = secondFaceUpCard else {return}
        // this is the second card guess, verify if its a match or not
        if firstFaceUpCard.image == secondFaceUpCard.image {
            // it's a match
            matches.append(firstFaceUpCard)
            matches.append(secondFaceUpCard)
        }
        //    // if it's not a match, do nothing
        //    self.firstFaceUpCard = nil
        //    self.secondFaceUpCard = nil
    }
    init(numberOfPairsofCards: Int, createdContent: (Int) -> String) {
        cards = []
        for pairIndex in 0..<numberOfPairsofCards {
            let image = createdContent(pairIndex)
            cards.append(Card(image: image, id: pairIndex * 2 ))
            cards.append(Card(image: image, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
}

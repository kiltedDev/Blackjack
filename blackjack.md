## Introduction

Blackjack is a card game between a player and the dealer using a deck of 52 cards. The object of the game is to reach a score as close to 21 as possible without exceeding it (bust). Both the dealer and the player are initially dealt two cards and have the option to receive another card (hit) or keep their current score (stand). The player can continually hit until they score 21 or bust. A dealer is required to stand when their score is between 17 and 21, inclusive.

A score is calculated by adding up the ranks of the cards in a player's hand.

* Face cards (Jack, Queen, King) are worth 10 points
* Aces are worth either 11 points or 1 point, whichever value yields the best score.
* Every other card is worth its face value.

The player is dealt first and continues to play until they bust or stand. Once a player stands, the dealer will then play until they bust or stand. If a player busts, the dealer wins. If the dealer busts, the player wins. If neither busts, whoever has the score closest to 21 wins. In case of a tie, neither the player nor the dealer wins.

## Learning Goals

* Practice problem decomposition and problem simplification.
* Write a program that utilizes multiple classes in separate files.
* Practice **object composition** (objects using objects).

## Instructions

Write a program where the user can play a game of **Blackjack**. Define and use the following classes to organize your code:

* `Card` to represent an individual playing card. This class should contain the suit and the value and provide methods for determining what type of card it is (e.g. face card or ace). Write the code to implement this class in `lib/card.rb`.
* `Deck` to represent a collection of 52 cards. When dealing a hand this class can be used to supply the `Card` objects. Write the code to implement this class in `lib/Deck.rb`.
* `Hand` to represent the player's and dealer's hand. This class will need to determine the best score based on the cards that have been dealt. Write the code to implement this class in `lib/hand.rb`.
* `lib/blackjack.rb` will contain code to interact with the classes you write and it will handle the logic of the game.


## Managing Problem Complexity with User Stories

The game of Blackjack, as it is played in a casino, is quite complex. The game involves betting, the possibility of "splitting" a hand into two separate hands, allowing the player to buy "insurance" when the dealer is showing an ace, as well as many other **special cases** which make up the game.

We can simplify the complex problem of Blackjack by describing the gameplay in the form of **user stories**. The goal of a well-written user story is to describe how a user will interact with the software. We can describe the special cases as user stories which could be completed at a later date (or not at all).

**Focus on implementing one user story at a time.** This is how professional software developers manage the complexity of large software projects.

The program should satisfy the following user stories:

#### Deal initial hand

```no-highlight
As a dealer
I want to initially deal out two cards to the current player
So that we can begin the game
```

Acceptance Criteria:

* Cards are dealt from a shuffled deck of 52 cards.
* Output `Player was dealt CARD` for each card the player receives.
* Output `Dealer was dealt CARD` for each card the dealer receives.

#### Prompt for input

```no-highlight
As a player
I want to be prompted to hit or stand
So that I know when I have to act
```

Acceptance Criteria:

* Prompt the player to hit or stand after they receive their initial hand.
* Continue prompting unless the player stands or busts.
* Output `Hit or stand (H/S): ` and read the user input on the same line.
* Notify the user when the input is invalid (neither hit or stand) and re-prompt.
* Allow uppercase or lowercase characters as user input.

#### Display score

```no-highlight
As a player
I want to know my current best possible score
So that I can decide whether to hit or stand
```

Acceptance Criteria:
* Display the player's score each time they have to hit or stand.
* Output `Players score: SCORE` on a separate line.
* Aces should count as one or eleven, whichever is closest to 21 without going over.

#### Player hits

```no-highlight
As a player
I want to hit
So that I can increase my score
```

Acceptance Criteria:

* "Hit" takes another card from the deck and places it in the player's hand.
* The player's best possible score should be recalculated and displayed again.
* If the player busts, output `Bust! Game over...` and exit the game.

#### Player stands

```no-highlight
As a player
I want to stand
So that I don't bust
```

Acceptance Criteria:

* "Stand" will end the player's turn and begin the dealer's turn.
* The player's best possible score should be recalculated and displayed again.

#### Dealer hits until score threshold

```no-highlight
As a dealer
I want to continue hitting until my score is at least 17
So that I get close to 21 without too much risk of busting.
```

Acceptance Criteria:

* While the dealer's best possible hand is below 17, continue hitting.
* If the dealer's lowest score exceeds 21, output `Bust! You win!`.

## Sample Output

```no-highlight
$ ./blackjack.rb
Welcome to Blackjack!

Player was dealt 10♦
Player was dealt A♣
Player score: 21

Hit or stand (H/S): s

Player score: 21


Dealer was dealt Q♠
Dealer was dealt 8♥
Dealer score: 18

Dealer stands.

You win!
```

```no-highlight
$ ./blackjack.rb
Welcome to Blackjack!

Player was dealt 7♦
Player was dealt 5♥
Player score: 12

Hit or stand (H/S): h

Player was dealt 2♥
Player score: 14

Hit or stand (H/S): h

Player was dealt J♠
Player score: 24

Bust! You lose...
```

### Tips

Since Aces are a special case, it is helpful to simplify the problem. Make Aces
worth 11 points. When you get the basic functionality of the application
working, _then_ attempt to solve the problem of handling Ace scoring. This is a
common strategy when problem solving with code: get the code working for a
simple case, then move on to the more complex cases.

It is not required, but it is recommended that you write unit tests for your
classes.

## WordPal

A simple word game like Words-with-Friends or Scrabble.

- A `Game` consists of many `Play`s
- A `Play` consists of one or more `Tiles`.
- Only valid `Tile`s are saved to the database.
- `Tile`s of a `Play` must follow Scrabble-like rules. `Tile`s in a play:
  - cannot be placed over an existing `Tile`.
  - must be in a single column or row (i.e. no diagonal)
  - must touch at least one previously played `Tile` or include the center square at (0,0)
  - must form one or more unbroken lines, possibly including previously played `Tile`s.

Your mission, should you choose to accept it, is to implement

1. unimplemented methods on the `Tile` class
1. `Play` validation logic to pass all the specs.

![](http://i.imgur.com/BBcA3PL.png)


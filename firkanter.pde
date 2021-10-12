// Lavet af Tobias M & Simon A.
// Vi viser hvordan man kan lave et kvadrat med størrelsen 100x100 i positionen 0,0 via forskellige metoder.

// Eksempel 1
// Metoden square(a, b, c), hvor a & b er den ønskede positions x & y koordinater, mens c er størrelsen af kvadratet, altså hver sides længde.
square(0, 0, 100); // Her angives positionen (0;0) og størrelsen 100.

// Eksempel 2
// Metoden rect(a, b, c, d) hvor a & b er den ønskede positions x & y koordinater, mens c & d er bredden og højden.
rect(0,0,100,100); // Her angives positionen (0;0) og størrelsen (100;100).

// Eksempel 3
// Metoden rect(a, b, c, d, e), som er ens med metoden i eksempel 2 med ét ekstra parameter, som bestemmer alle hjørnernes radius, hvilket kan gøre dem rundet.
rect(0,0,100,100,0); // Her angives positionen (0;0), størrelsen (100;100) og en radius på nul, da alle firkanterne skal være identiske.

// Eksempel 4
// Metoden rect(a, b, c, d, e, f, g, h), som er ens med metoden i eksempel 3 men med 8 parametre, hvor de fire sidste bestemmer hvert hjørnes individuelle radius.
rect(0,0,100,100,0,0,0,0); // Her angives positionen (0;0), størrelsen (100;100) og de fire sidste parametre på nul, da vi skal have en identisk firkant.

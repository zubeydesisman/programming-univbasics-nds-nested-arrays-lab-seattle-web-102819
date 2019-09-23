# Nested Arrays Lab

## Learning Goals

1. Recognize vocabulary term: "array of array"
2. Recognize that "arrays of arrays" are grids or coordinate systems
3. Create a nested `Array`
4. Read scalar data from an array of arrays
5. Modify scalar data in an array of arrays

## Introduction

### Key Image: Coordinate Grid

To help you when reading the rest of this lesson, keep in mind that an Array of
Arrays (or a matrix) is well expressed by a ***grid***. Here are some examples
to get your mind ready.

Think about those vending machines where you select the item you want by
finding its coordinates and entering them in on a keypad.

![Grid-based vending machine](https://curriculum-content.s3.amazonaws.com/programming-univbasics-5/nested-arrays-lab/vending_grid.png)

Think about chess boards where each square has a row and column coordinate
according to Stamma's algebraic notation for chess:

![Chessboard with Stamma's Notation](https://curriculum-content.s3.amazonaws.com/programming-univbasics-5/nested-arrays-lab/chess_grid.png)

Think about latitude and longitude uniquely identifying a place on a map.

![Map + LatLong](https://curriculum-content.s3.amazonaws.com/programming-univbasics-5/nested-arrays-lab/nyc_latlong_sm.png)

_Photo credit: Mike C. Valdivia on Unsplash_


### From Array to Array of Array

An `Array` is like a list but in code form. It is a way for your program to
store pieces of data as elements in a collection. Arrays can contain any
combination of data types -- `Boolean`s, `Integer`s, `Strings`.

Let's imagine an `Array` as a **single** long shelf with books on it. The shelf
is like the `Array` and each book is an element of it.  We can refer to books
by saying things like the following:

* _House of Leaves_ is the **third** book from the **left-most edge**
* The best Latin grammar book is the **second** book from the **left-most edge**
* The **zeroth** book from the **left-most edge** (i.e. the first book) is Hegel's _Phenomenology_

But what if we had _multiple_ bookshelves that we stacked on top of each other?
It would look a bit more like our "key image," the grid. We call a piece of
furniture that holds books in a grid-like arrangement a "bookcase."

To refer to a book, we provide ***two pieces of information***:

1. Which shelf from the bottom
2. What distance from the left

Thus we'd say:

* _Kafka on the Shore_ is:
  1. On the shelf that's 3rd from the bottom of the bookcase and
  2. is second from the left-most edge.

And the books from our previous single shelf would need more data provided:

* _House of Leaves_ is on the zeroth shelf from the bottom, the **third** book from the left-most edge
* The best Latin grammar book is on the zeroth shelf from the bottom, the **second** book from the left-most edge
* On the zeroth shelf from the bottom at the **zeroth** book from the left-most edge (i.e. the first book) you will find Hegel's _Phenomenology_

Draw it out for yourself if you're unsure, but this matches our key image: a
***grid***.

Here's how an `Array` of `Array`s creates a grid:

![AoA to Grid](https://curriculum-content.s3.amazonaws.com/programming-univbasics-5/nested-arrays-lab/nested_array.png)

## Recognize Vocabulary Term: "Array of Array"

Nested Arrays have been an important tool for thinking about data for a long
time. In fact this idea is older than computers and is at least as old as the
Pharonic Egypt. As such, there are lots of words that mean "Array of Arrays."
Here's a quick reference. You don't need to memorize these, but if you're
trying to model a problem as a programmer, you might see someone use these
words.

* **2-D** array: "Two dimensional Array:" another word for an nested array
* **Multidimensional Array**: 3-D arrays are also possible (`Array` of `Array`
  of `Array`). This results in the category known as "Multidimensional
  Arrays"
* **AoA**: **A**rray **o**f **A**rray: another word for an nested array
* **cell** or **cel**: the coordinate element inside of an `Array` that itself
  is inside another `Array`; alternatively, it's what's in the **grid** at the
  intersection of two coordinates
* **grid**: Another word for "array of arrays"; the key image of an `Array` of `Array`s
* **inner `Array`**: Since we're making `Array`s of `Array`s the `Array`s
  contained by the outer-most `Array` can be called "inner arrays"
* **outer `Array`**: See "inner `Array`"
* **matrix**: Yet another word for an Array of Arrays
* **`X` by `Y` array**: An array that contains `Y`-many many rows with `X`-many
  elements in it. It defines the size of a matrix's maximum space (or, "area")
## Recognize that "Arrays of Arrays" Are Grids or Coordinate Systems

You might have noticed from our bookcase example, that finding a book in a
two-dimensional `Array` required us to pass two integers or coordinates.

Anywhere where humans might see a grid (latitude/longitude as coordinates on a
map, the Cartesian coordinate system for graphing, B9 as the coordinate of a
snack in a vending machine), it's very likely the grid would be stored in a
computer in a 2-D matrix.

Applications of nested `Arrays` are many:

* Keeping track of the kids' names on the "hand-hold ropes" at a museum (5 kids
  per rope, 5 ropes per class, maximum 25 kids per field trip)
* The latest fantasy video game (The dungeon is a 10 by 10 matrix of rooms.
  When the player activates, load the character in room (2, 3)` where
  `dungeon_map[2][3]` points to the `String`: `"The Throne Room"`)
* Tetris-like games and its children (When the block rests, visit each row and
  count whether every element in the row is status "filled." If all cells are
  filled, remove the row)
* Art. Filling in colors in a simple matrix is how "sprite" art is created. The
  beloved original Nintendo Mario or the hero Link from "Legend of Zelda" were
  both simple colored cells within a matrix

## Create a Nested `Array`

Let's make a spice rack (a bookcase, but for spices):

```ruby
# Simple 1-D arrays
shelf_1 = ["Mace", "Ginger", "Marojam"]
shelf_2 = ["Paprika", "Fajita Mix", "Coriander"]
shelf_3 = ["Parsley", "Sage", "Rosemary"]

spice_rack = [
  shelf_1,
  shelf_2,
  shelf_3,
] # => [["Mace", "Ginger", "Marojam"], ["Paprika", "Fajita Mix", "Coriander"], ["Parsley", "Sage", "Rosemary"]]
```

If we don't need to use `shelf_1`, `shelf_2`, `shelf_3`, then we don't need to
assign them before nesting them in `spice_rack`.  We can write a nested `Array`
using `Array` literal formatting:

```ruby
# 2-D Array all in one go
spice_rack = [["Mace", "Ginger", "Marojam"], ["Paprika", "Fajita Mix", "Coriander"], ["Parsley", "Sage", "Rosemary"]]

# Same as above, but using whitespace to make it easier for humans to read

spice_rack_pretty = [
  ["Mace", "Ginger", "Marojam"],
  ["Paprika", "Fajita Mix", "Coriander"],
  ["Parsley", "Sage", "Rosemary"]
]
```

Since Ruby doesn't care about whitespace, so we'd advise you to write a 2-D
`Array` like `spice_rack_pretty`.

## Read Scalar Data From a Nested Array

One of the defining features of 2-D `Array`s is that we use coordinates to
target unique elements in a ***grid***. To read an element from a nested
`Array`, simply provide the coordinates.

```ruby
spice_rack = [
    # 0        1          2
  ["Mace", "Ginger", "Marojam"],             # 0
  ["Paprika", "Fajita Mix", "Coriander"],    # 1
  ["Parsley", "Sage", "Rosemary"]            # 2
]

spice_rack[0] #=>  ["Mace", "Ginger", "Marojam"]
spice_rack[0][1] #=> "Ginger"
spice_rack[1][1] #=> "Fajita Mix"
```

The first set of brackets refers to the row of the nested Array.  The second
set of brackets refer to the element within that row.

## Modify Scalar Data In an Array of Arrays

The same technique of using coordinates applies both to reading and
modification. If you can "target" an element you can read it or update it.

```ruby
spice_rack = [
    # 0        1          2
  ["Mace", "Ginger", "Marojam"],             # 0
  ["Paprika", "Fajita Mix", "Coriander"],    # 1
  ["Parsley", "Sage", "Rosemary"]            # 2
]

spice_rack[1][1] #=> "Fajita Mix" (it's not really a spice)
spice_rack[1][1] = "Cumin" #=> "Cumin"
spice_rack[1][1] #=> "Cumin"
```

## Conclusion

Congratulations, you've learned to use your first nested data structure: the
`Array` of `Array`s (or "matrix," or "coordinate grid"). You've seen that you
can build them by build `Array`s filled with variables that point to other
`Array`s, or that you can use `Array` literal notation to build them out.
You've seen that you can use coordinates to look up elements in the matrix as
well as update those elements. In the lab associated with this material, you'll
have a chance to make sure you've understood the basics.

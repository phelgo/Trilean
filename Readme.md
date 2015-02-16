# Trilean - yes, no, *maybe*

### Three-valued logic for Swift
Trileans are similar in many ways to standard booleans except that instead of 2 possible values they have 3: *yes*, *no* or *maybe*. They allow for [three-valued logic](http://en.wikipedia.org/wiki/Three-valued_logic) which may be useful to make assertions where not all variables are known. Applications include artificial intelligence for games or simulations, where an agent must make decisions without a full knowledge of its environment.

### Initialization
Trileans are typically initialized by assigning a trilean literal.

```swift
var yesTrilean = yes
var noTrilean = no
var maybeTrilean = maybe
```

As a convenience, trileans can also be initialized from booleans.

```swift
var yesTrilean: Trilean = true
var noTrilean: Trilean = false
```

### Control Flow - Sure Statements
The Trilean class provides 3 control flow functions, ```sure()```, ```sureNot()``` and ```unsure()``` that you can use to perform code that is dependent on a trilean value.


```swift
sure(myTrilean) {
    // preform the yes case
}
sureNot(myTrilean) {
    // perform the no case
}
unsure(myTrilean) {
    // perform the maybe case
} 
```

### Control Flow - If Statements
You can use trileans almost everywhere you would use booleans, including if statements.

```swift
if myTrilean {
    // perform the yes case
}
else {
    // perform the no or maybe case
}
```
By default only the *yes* trilean is converted to *true* and both *no* and *maybe* are converted to *false*. You can however make an optimistic conversion where the *maybe* trilean will be converted to *true*.

```swift
if myTrilean.optimistically {
    // perform the yes or maybe case
}
else {
    // perform the no case
}
```

### Logic Operators
Trileans support the ```&&```, ```||``` and ```!``` operators, meaning you can make compound assertions such as:

```swift
sure((trileanA || trileanB) && (trileanC || trileanD)) {
    // perform code
}
```

The result of conjunction, disjunction and negation are implemented according to [Łukasiewicz logic](http://en.wikipedia.org/wiki/%C5%81ukasiewicz_logic):

**Conjunction - A AND B**

| AND          | **yes**      | **maybe**    | **no**       |
| :----------: | :----------: | :----------: | :----------: |
| **yes**      | yes          | maybe        | no           |
| **maybe**    | maybe        | maybe        | no           |
| **no**       | no           | no           | no           |

**Disjunction - A OR B**

| OR           | **yes**      | **maybe**    | **no**       |
| :----------: | :----------: | :----------: | :----------: |
| **yes**      | yes          | yes          | yes          |
| **maybe**    | yes          | maybe        | maybe        |
| **no**       | yes          | maybe        | no           |

**Negation - NOT A**

|  A           | NOT A        |
| :----------: | :----------: |
| **yes**      | no           |
| **maybe**    | maybe        |
| **no**       | yes          |

### License
Copyright © 2014-2015 [@phelgo](https://twitter.com/phelgo). [MIT licensed](http://www.opensource.org/licenses/MIT) to you.

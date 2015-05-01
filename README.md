# Important notice

This module should not yet be depended on, it is for the upcoming 0.7 compiler release.

# Module Documentation

## Module Console

#### `CONSOLE`

``` purescript
data CONSOLE :: !
```

The `CONSOLE` effect represents those computations which write to the console.

#### `log`

``` purescript
log :: forall eff. String -> Eff (console :: CONSOLE | eff) Unit
```

Write a message to the console.

#### `error`

``` purescript
error :: forall eff. String -> Eff (console :: CONSOLE | eff) Unit
```

Write an error to the console.

#### `print`

``` purescript
print :: forall a eff. (Show a) => a -> Eff (console :: CONSOLE | eff) Unit
```

Write a value to the console, using its `Show` instance to produce a `String`.




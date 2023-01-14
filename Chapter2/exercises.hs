-- 13. What do you think is the type of id?

{- id :: t -> t -}


-- 14. A great example for the power of polymorphism is the following type signature:
--     (a -> b -> c) -> b -> a -> c
--     There is a function of that type in the standard library.
--     Can you tell what it does? Can you guess its name?

{- The type signature suggests the function takes a function and two arguments
and applies the recieved function with the arguments flipped. -}


-- 15. Consider the following definition:
--     data Wat = Wat Wat
--     Is this legal? What does it mean? Which occurrences of Wat are terms, and which are types?
--     Can you define a value of type Wat?

{- The type is legal. The code means that a value of type `Wat` is built from the constructor `Wat`,
applied to a value of type `Wat`, i.e., this type is an infinite stack of `Wat`s -}


-- 16. How many values are there of type Maybe (Maybe Bool). When can it be useful to nest Maybe in that way?

{- There are four possible values: `Nothing`, `Just (Nothing)`, `Just (Just True)` and `Just (Just False)`.
It can be used to differentiate between valid, invalid and empty inputs. -}


-- 17. How could you represent the Riemann numbers from the previous section using only these predefined data types?

{- Maybe (Integer, Integer) ==> Infinity == Nothing and Complex == (Integer, Integer) -}


-- 18. Write functions
--     fromEitherUnit :: Either () a -> Maybe a
--     and
--     toEitherUnit :: Maybe a -> Either () a

fromEitherUnit :: Either () a -> Maybe a
fromEitherUnit (Right x) = Just x
fromEitherUnit (Left _) = Nothing

toEitherUnit :: Maybe a -> Either () a
toEitherUnit Nothing = Left ()
toEitherUnit (Just x) = Right x

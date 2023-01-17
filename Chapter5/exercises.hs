import Data.ByteString (ByteString)

-- 21. Write an Eq instance for Employee, using record accessors.
--     Is there a problem with this code?

data Employee = Employee
    { name :: String
    , room :: Integer
    , pubkey :: ByteString
    }

instance Eq Employee where
    Employee n1 r1 p1 == Employee n2 r2 p2 = n1 == n2 && r1 == r2 && p1 == p2


-- 22. Look up the Semigroup type class, and find its laws.

{- The `Semigroup` type class is defined as:
class Semigroup a where
    (<>) :: a -> a -> a

and has the following law (associativity):
(a <> b) <> c == a <> (b <> c)
-}


-- 23. Can you think of a Semigroup (Tree a) instance?
--     Or maybe even more than one?
--     How can you be sure it is a lawful instance?

data Tree a = Leaf | Node a (Tree a) (Tree a)

instance Semigroup (Tree a) where
    Leaf <> tree = tree
    Node x l r <> tree = Node x l (r <> tree)

-- instance Semigroup a => Semigroup (Tree a) where
--     Leaf <> tree = tree
--     tree <> Leaf = tree
--     Node x l1 r1 <> Node y l2 r2 = Node (x <> y) (l1 <> l2) (r1 <> r2)


-- 24. The Monoid class extends the Semigroup class with an operation
--     mempty :: Monoid a => a that is supposed to be a neutral element of (<>)

--     Given a function signature summarize :: Monoid a => Tree a -> a,
--     can you guess what it does? What would be the implementation you expect?

--     With that implementation, can you use summarize to distinguish trees that differ in shape,
--     but have the same elements in the same order? What does this imply for search trees?

{- The function `summarize` returns the data stored in the tree. -}
summarize :: Monoid a => Tree a -> a
summarize Leaf = mempty
summarize (Node x l r) = summarize l <> x <> summarize r

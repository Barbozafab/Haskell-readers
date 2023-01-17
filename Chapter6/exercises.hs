import Prelude hiding (fmap, (<$>))

-- 25. Give definitions of the operators up to join using (>>=), return, and operators you already defined.
--     (You will have to change the constraints to Monad for this to typecheck.)

(>>) :: Monad m => m a -> m b -> m b
a >> b = a >>= (\_ -> b)

fmap :: Monad f => (a -> b) -> f a -> f b
fmap f a = a >>= (return . f)

(<$>) :: Monad f => (a -> b) -> f a -> f b
(<$>) = fmap

(<$) :: Monad f => a -> f b -> f a
x <$ a = const x <$> a

liftA2 :: Monad f => (a -> b -> c) -> f a -> f b -> f c
liftA2 f a b = a >>= (\x -> b >>= (\y -> return (f x y)))

(<*>) :: Monad f => f (a -> b) -> f a -> f b
(<*>) = liftA2 (\f x -> f x)

(<*) :: Monad f => f a -> f b -> f a
(<*) = liftA2 (\x y -> x)

(*>) :: Monad f => f a -> f b -> f b
(*>) = liftA2 (\x y -> y)

(>=>) :: Monad m => (a -> m b) -> (b -> m c) -> (a -> m c)
a >=> b = (\x -> a x >>= b)

join :: Monad m => m (m a) -> m a
join a = a >>= id


-- 26. Why is the type `when :: Bool -> f () -> f ()`, and not `when :: Bool -> m a -> m a`?

{- `when False action` is not supposed to execute `action`, `when` can't produce `m a`,
but it can always produce `f ()` using `return ()` -}


-- 27. Implement `forM :: Monad m => [a] -> (a -> m b) -> m [b]` using `do`-notation.
forM :: Monad m => [a] -> (a -> m b) -> m [b]
forM [] _ = return []
forM (x : xs) f = do
    y <- f x
    ys <- forM xs f
    return (y : ys)


-- 28. You might observe that Tagged is simply the existing pair type.
--     There is an Applicative instance for pairs. Look it up!
--     How does that fit to what I just said?

{- The instance is: `instance Monoid r => Applicative ((,) r) -}

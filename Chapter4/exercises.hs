-- 19. What does this program print?
-- theAnswer :: IO Integer
-- theAnswer = do
--     putStrLn "Pondering the question..."
--     return 23
--     return 42

-- main :: IO ()
-- main = do
--     a <- theAnswer
--     putStrLn (show a)

{- It prints:
`
Pondering the question...
42
` -}


-- 20. What does this program do?
-- foo :: Integer -> IO () -> IO ()
-- foo 0 a = putStrLn "Done"
-- foo n a = do
--     if n == 1
--     then putStrLn "Almost done"
--     else return ()
--     a
--     foo (n -1) a

-- main :: IO ()
-- main = do
--     foo 4 (putStrLn "Hooray!")
--     foo 0 (putStrLn "And up she rises.")

{- It prints:
`
Hooray!
Hooray!
Hooray!
Almost done
Hooray!
Done
Done
` -}

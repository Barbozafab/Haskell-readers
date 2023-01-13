-- 1. What associativity do you expect for (+) and (-)?

{- I would expect both (+) and (-) to be left-associative. -}


-- 2. Look up the precedences of the other arithmetic operations,
--    and see how that corresponds to the PEMDAS rule.

{- The precedence of (^) is greater than the precedence of (*),
which is greater than the precedence of (+) and (-). -}


-- 3. Can you predict the result of the following?

{- 1 + const 2 3 + 4 ==> 7 -}


-- 4. What is the result of

{- (-) 5 $ div 16 $ (-) 10 $ 4 `div` 2 ==> 3 -}


-- 5. Discuss: Think of other programming language that have concepts called functions.
--    Can you always replace a function call with the function definition?
--    Does it change the meaning of the program?

{- Not always. Sometimes a function a function has side effects,
such as modifying global variables or changin the state of the program,
changing the meaning of the program. -}


-- 6. Write a function absoluteValue with one parameter.
--    If the parameter is negative, returns its opposite number,
--    otherwise the number itself.

absoluteValue x = if x < 0 then - x else x


-- 7. Write a function isHalfRound that checks if a number is divisible by 5, 
--    by checking whether the last digit is 0 or 5.

isHalfRound x = x `mod` 10 == 0 || x `mod` 10 == 5


-- 8. Write a function isEven that checks if a number is divisible by 2, 
--    by checking whether the last digit is 0, 2, 4, 6, 8.

isEven x = x `mod` 10 == 0 || x `mod` 10 == 2 || x `mod` 10 == 4 || x `mod` 10 == 6 || x `mod` 10 == 8


-- 9. Write the function sumDigits that sums up the digits of a natural number.

sumDigits x = if x < 10 then x else sumDigits (x `div` 10) + x `mod` 10


-- 10. Write a (recursive) function fixEq so that fixEq f x repeatedly
--     applies f to x until the result of f is the same as its argument.

fixEq f x = if f x == x then x else fixEq f (f x)


-- 11. Use this function and sumDigits to write a function isMultipleOf3
--     so that isMultipleOf3 x is true if repeatedly applying sumDigits to x results in 3, 6 or 9.

isMultipleOf3 x = fixEq sumDigits x == 3 || fixEq sumDigits x == 6 || fixEq sumDigits x == 9


-- 12. Which other recent definitions can be changed accordingly?

{- countCountDigits and sumSumDigits. -}

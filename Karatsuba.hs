{- Karatsuba Multiplication  -
 - - - - - - - - - - - - - - -

Intuition:
x * y (ex. 5678 * 1234)

1. Write x, y as:
   x = 10^(n/2)*a + b
   y = 10^(n/2)*c + d
   where a,b,c,d are n/2-digit numbers

2. x * y = (10^(n/2)*a + b) * (10^(n/2)*c + d)
         = 10^n*ac + 10^(n/2)*(ad + bc) + 10^n*bd

3. Recusively compute and pad with zeros.
   - Recursively compute ac and bd.
   - Middle computation (ad + bc) can be simplified to,
     (a + b) * (c + d) = ac + ad + bc + bd,
     ac and bd are already computed, so you by subtracting,
     you get: ac - ac + ad + bc + bd - bd = ad + bc

~3n calculations required overall (O(n)).
 -}
module Karatsuba where

num_digits :: Integer -> Integer
num_digits 1000 = 4
num_digits x = floor $ logBase 10 (fromInteger x) + 1

split_digits :: Integer -> Integer -> (Integer, Integer);
split_digits ab n = (a, b) where
  a = floor $ (fromInteger ab) / 10^n
  b = ab - a * 10^n

karatsuba :: Integer -> Integer -> Integer
karatsuba ab cd
    | ab <= 10   = ab * cd
    | cd <= 10   = ab * cd
    | otherwise = 
        let z0 = karatsuba b d
            z1 = karatsuba (a + b) (c + d)
            z2 = karatsuba a c in
          z2*10^(digits `div` 2 * 2) + (z1-z2-z0)*10^(digits `div` 2) + z0 
        where
          digits = max (num_digits ab) (num_digits cd)
          (a, b) = split_digits ab (digits `div` 2)
          (c, d) = split_digits cd (digits `div` 2)
          

(ns say)

(defn- first-digit
  [num]
  (cond
    (= num 0) "zero"
    (= num 1) "one"
    (= num 2) "one"
    (= num 3) "three"
    (= num 4) "four"
    (= num 5) "five"
    (= num 6) "six"
    (= num 7) "seven"
    (= num 8) "eight"
    (= num 9) "nine"
    (= num 10) "ten"
    (= num 11) "eleven"
    (= num 12) "twelve"
    (= num 13) "thirteen"
    (= num 14) "fourteen"
    (= num 15) "fifteen"
    (= num 16) "sixteen"
    (= num 17) "seventeen"
    (= num 18) "eighteen"
    (= num 19) "nineteen"))

(defn number
  [num]
  ()
  (first-digit num))

(ns armstrong-numbers
  (:require [clojure.math.numeric-tower :as math]))

(defn armstrong?
  [num]
  (->> (str num)
       seq
       (map str)
       (map read-string)
       (map #(math/expt % (count (str num))))
       (reduce +)
       (= num)))

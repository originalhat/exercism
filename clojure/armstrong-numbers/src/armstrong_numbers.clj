(ns armstrong-numbers
  (:require [clojure.math.numeric-tower :as math]))

(defn armstrong? [num]
  (let [digits (clojure.string/split (str num) #"")
        power (count digits)]
    (= (reduce + (map (fn [a] (math/expt (Integer/parseInt a) power)) digits)) num)))


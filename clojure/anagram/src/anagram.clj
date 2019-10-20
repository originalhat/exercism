(ns anagram
  (:require [clojure.string :as str]))

(defn anagrams-for [word prospect-list]
  (->> prospect-list
       (filter #(not= (str/lower-case word) %))
       (filter #(= (count word) (count %)))
       (filter #(= (sort (str/lower-case word))
                   (sort (str/lower-case %))))))

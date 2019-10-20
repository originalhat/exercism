(ns anagram
  (:require [clojure.string :as str]))

(defn anagrams-for [word prospect-list]
  (->> prospect-list
       (filter #(not= (str/lower-case word) %))
       (filter #(= (count word) (count %)))
       (filter #(= (sort (re-seq #"\w" (str/lower-case word)))
                   (sort (re-seq #"\w" (str/lower-case %)))))))

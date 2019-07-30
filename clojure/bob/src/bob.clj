(ns bob
  (:require [clojure.string :as s]))

(defn response-for
  [sentence]
  (cond
    (= 0 (count (s/trim sentence))) "Fine. Be that way!"
    (every? #(Character/isUpperCase %) (clojure.string/replace sentence #"[^\p{L}]" "")) "Whoa, chill out!"
    (s/includes? sentence "?") "Sure."
    :else "Whatever."))

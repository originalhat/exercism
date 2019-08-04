(ns bob
  (:require [clojure.string :as s]))

(defn shouting?
  "Returns true if the entire sentence is in caps, save special chars"
  [sentence]
  (every?
    #(Character/isUpperCase %)
    (clojure.string/replace sentence #"[^\p{L}]" "")))

(defn response-for
  [sentence]
  (let [is-question? (s/ends-with? sentence "?")
        is-quiet? (= 0 (count (s/trim sentence)))
        is-shouting? (shouting? sentence)]
    (cond
      is-quiet? "Fine. Be that way!"
      is-shouting? "Whoa, chill out!"
      is-question? "Sure."
      :else "Whatever.")))

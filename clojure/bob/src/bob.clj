(ns bob
  (:require [clojure.string :as s]))

(defn- is-shouting?
  "Returns true if the entire sentence is in caps, save special chars."
  [sentence]
  (every?
    #(Character/isUpperCase %)
    (clojure.string/replace sentence #"[^\p{L}]" "")))

(defn- is-quiet?
  "Returns true if there is no response."
  [sentence]
  (= 0 (count (s/trim sentence))))

(defn- is-question?
  "Returns true if sentence is a question."
  [sentence]
  (s/ends-with? sentence "?"))

(defn response-for
  [sentence]
  (cond
    (is-quiet? sentence) "Fine. Be that way!"
    (is-shouting? sentence) "Whoa, chill out!"
    (is-question? sentence) "Sure."
    :else "Whatever."))

(ns bob
  (:require [clojure.string :as s]))

(defn- is-shouting?
  "Returns true if the entire sentence is in caps, save special chars."
  [sentence]
  (every?
    #(Character/isUpperCase %)
    (s/replace sentence #"[^\p{L}]" "")))

(defn- is-only-numbers?
  "Returns true if the entire sentence is numeric, save special chars."
  [sentence]
  (every?
    #(Character/isDigit %)
    (s/replace sentence #"[^\p{L}|\d]" "")))

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
    (and (is-only-numbers? sentence) (is-question? sentence)) "Sure."
    (and (is-question? sentence) (is-shouting? sentence)) "Calm down, I know what I'm doing!"
    (is-question? sentence) "Sure."
    (is-only-numbers? sentence) "Whatever."
    (is-shouting? sentence) "Whoa, chill out!"
    :else "Whatever."))

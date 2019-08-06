(ns bob
  (:require [clojure.string :as s]))

(defn- shouting?  [sentence]
  (every?
    #(Character/isUpperCase %)
    (s/replace sentence #"[^\p{L}]" "")))

(defn- is-only-numbers?
  [sentence]
  (every?
    #(Character/isDigit %)
    (s/replace sentence #"[^\p{L}|\d]" "")))

(defn- silence?  [sentence] (s/blank? sentence))

(defn- question?  [sentence] (s/ends-with? sentence "?"))

(defn response-for
  [sentence]
  (cond
    (silence? sentence) "Fine. Be that way!"
    (and (is-only-numbers? sentence) (question? sentence)) "Sure."
    (and (question? sentence) (shouting? sentence)) "Calm down, I know what I'm doing!"
    (question? sentence) "Sure."
    (is-only-numbers? sentence) "Whatever."
    (shouting? sentence) "Whoa, chill out!"
    :else "Whatever."))

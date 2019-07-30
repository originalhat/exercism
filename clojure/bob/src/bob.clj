(ns bob
  (:require [clojure.string :as s]))

;; TODO: is upper case? don't match on #'s or special characters
;; (every? #(Character/isUpperCase))

(defn response-for
  [sentence]
  (cond
    (= 0 (count (s/trim sentence))) "Fine. Be that way!"
    (every? #(Character/isUpperCase %) (clojure.string/replace sentence #"[^\p{L}]" "")) "Whoa, chill out!"
    :else "Whatever."))

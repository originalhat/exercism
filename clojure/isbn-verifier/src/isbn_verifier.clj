(ns isbn-verifier
  (:require [clojure.string :as str]))

(defn- parse-isbn
  [isbn]
  (as-> isbn s
        (str/replace s #"-" "")
        (str/split s #"")
        (conj (vec (drop-last s)) (str/replace (last s) #"X" "10"))
        (map read-string s)
        (reverse s)
        (vec s)))

(defn- valid-isbn-shape?
  [parsed-isbn]
  (and (= 10 (count parsed-isbn))
       (some? (re-matches #"\d+" (str/join parsed-isbn)))))

(defn- valid-isbn?
  [parsed-isbn]
  (zero?
    (mod (->> parsed-isbn
              (map-indexed (fn [idx itm] (* (+ idx 1) itm)))
              (reduce +)) 11)))

(defn isbn? [isbn]
  (let [parsed-isbn (parse-isbn isbn)]
    (and (valid-isbn-shape? parsed-isbn) (valid-isbn? parsed-isbn))))

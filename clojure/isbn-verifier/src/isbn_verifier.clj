(ns isbn-verifier
  (:require [clojure.string :as str]))

(defn- valid-isbn?
  [processed-isbn]
  (and (= 10 (count processed-isbn))
       (some? (re-matches #"\d+" (str/join processed-isbn)))))

(defn isbn? [isbn]
  (let [processed-isbn (as-> isbn s
                             (str/replace s #"-" "")
                             (str/split s #"")
                             (conj
                               (vec (drop-last s))
                               (str/replace (last s) #"X" "10"))
                             (map read-string s)
                             (reverse s)
                             (vec s))]

    (if (valid-isbn? processed-isbn)
      (= 0 (mod (->> processed-isbn
                     (map-indexed (fn [idx itm] (* (+ idx 1) itm)))
                     (reduce +)) 11))
      false)))

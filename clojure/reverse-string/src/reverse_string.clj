(ns reverse-string)

(defn reverse-string
  [s]
  (clojure.string/join
    (reverse
      (clojure.string/split s #""))))



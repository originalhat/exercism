(ns reverse-string)

(defn reverse-string
  [s]
  (-> (clojure.string/split s #"")
      (reverse)
      (clojure.string/join)))


(ns word-count)

(defn- lowercased-words
  [sentence]
  (->> sentence
       (re-seq #"\w+")
       (map #(clojure.string/lower-case %))))

(defn word-count
  [sentence]
  (frequencies (lowercased-words sentence)))

(ns run-length-encoding)

(defn run-length-encode
  "encodes a string with run-length-encoding"
  ([]
   (run-length-encode ""))
  ([plain-text]
   (apply str
          (mapcat #(if (= 1 (count %))
                     [(first %)]
                     [(count %) (first %)])
                  (partition-by identity
                                (clojure.string/split plain-text #""))))))

(defn run-length-decode
  "decodes a run-length-encoded string"
  ([]
   (run-length-decode ""))
  ([cipher-text]
   (apply str (mapcat #(if (= 1 (count %))
                         %
                         (repeat
                           (Integer/parseInt (apply str (drop-last %)))
                           (last %)))
                      (re-seq #"[1-9]*[a-zA-Z\W]" cipher-text)))))

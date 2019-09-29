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
  [cipher-text])

(ns run-length-encoding)

(defn run-length-encode
  "encodes a string with run-length-encoding"
  ([]
   (run-length-encode ""))
  ([plain-text]
   (->> plain-text
        (partition-by identity)
        (mapcat #(if (= 1 (count %))
                   [(first %)]
                   [(count %) (first %)]))
        (apply str))))

(defn run-length-decode
  "decodes a run-length-encoded string"
  ([]
   (run-length-decode ""))
  ([cipher-text]
   (->> cipher-text
        (re-seq #"[1-9]*[a-zA-Z\W]")
        (mapcat #(if (= 1 (count %))
                   %
                   (repeat
                     (->>
                       %
                       drop-last
                       (apply str)
                       (Integer/parseInt))
                     (last %))))
        (apply str))))

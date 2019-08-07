(ns rna-transcription)

(defn to-rna
  [dna]
  (cond
    (= "C" dna) "G"
    (= "G" dna) "C"
    (= "A" dna) "U"
    (= "T" dna) "A"))

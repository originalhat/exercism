(ns rna-transcription)

(defn- translate-nucleotide
  [nucleotide]
  (cond
    (= "C" nucleotide) "G"
    (= "G" nucleotide) "C"
    (= "A" nucleotide) "U"
    (= "T" nucleotide) "A"))

(defn- valid-dna?
  [dna]
  (= 0 (count (re-seq #"[^CGAT]" dna))))

(defn to-rna
  [dna]
  (if (valid-dna? dna)
    (clojure.string/replace dna #"[CGAT]" #(translate-nucleotide %1))
    ((throw (AssertionError. "invalid nucleotide")))))

(defrule ask
    =>
    (printout t "Apa jenis teknologi yang anda inginkan dari mobil listrik? [B: BEV, P: PHEV]: ")
    (assert (jenis (read)))
    (printout t "Berapa range harga yang anda inginkan?" crlf)
    (printout t "[A: 240-650 juta, B: 651-900 juta, C: 901 juta - 3 miliar]: ")
    (assert (harga (read)))
    (printout t "Berapa battery range mobil yang anda inginkan?" crlf)
    (printout t "[1: 1-90 km, 2: 91 - 350 km, 3: 351 - 700 km ]: ")
    (assert (baterai (read)))
    (printout t "Berapa charging time mobil yang anda inginkan?" crlf)
    (printout t "[F: 30 menit-7 jam, S: 8-11 jam]: ")
    (assert (charging (read)))
) 

(defrule hyundaiIonic
    (and (jenis B)
    (harga B)
    (baterai 3)
    (charging F))
    =>
    (assert (mobil hyundaiIonic))
    (printout t "Mobil yang cocok dengan kriteria anda adalah Hyundai Ionic 5" crlf)
)

(defrule wulingAir
    (jenis B)
    (harga A)
    (baterai 2)
    (charging S) 
    =>
    (assert (mobil wulingAir))
    (printout t "Mobil yang cocok dengan kriteria anda adalah Wuling Air ev" crlf)
)

(defrule teslaModel
    (jenis B)
    (harga C)
    (baterai 3)
    (charging F|S)
    =>
    (assert (mobil teslaModel))
    (printout t "Mobil yang cocok dengan kriteria anda adalah Tesla Model 3" crlf)
)

(defrule bmwI
    (jenis B)
    (harga C)
    (baterai 3)
    (charging F)
    =>
    (assert (mobil bmwI))
    (printout t "Mobil yang cocok dengan kriteria anda adalah BMW i4" crlf)
)

(defrule lexusUX
    (jenis B)
    (harga C)
    (baterai 2)
    (charging F|S)
    =>
    (assert (mobil lexusUX))
    (printout t "Mobil yang cocok dengan kriteria anda adalah Lexus UX300e" crlf)
)

(defrule mitsubishiOutlander
    (jenis P)
    (harga B)
    (baterai 1)
    (charging F)
    =>
    (assert (mobil mitsubishiOutlander))
    (printout t "Mobil yang cocok dengan kriteria anda adalah Mitsubishi Outlander PHEV" crlf)
)

(defrule error
    (and (jenis B|P) (not (mobil hyundaiIonic|wulingAir|teslaModel|bmwI|lexusUX|mitsubishiOutlander)))
    =>
    (assert (error))
    (printout t "Tidak dapat memberikan rekomendasi mobil dengan kriteria yang anda pilih" crlf)
)
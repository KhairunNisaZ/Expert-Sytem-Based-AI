(defrule diri
    =>
    (printout t crlf "Masukkan nama anda: ")
    (assert (nama (read)))
)

(defrule intro
    (nama ?name)
    =>
    (printout t crlf "              *********** Halo "?name" **********              " crlf)
    (printout t crlf "              WELCOME TO ELECTRIC CAR RECCOMENDER              " crlf)
)

(deffacts again
    (again yes)
)

(defrule ask
    ?a <- (again yes)
    =>
    (retract ?a)
    (assert (input Data))
    (printout t crlf "------------------Rekomendasi Mobil Listrik--------------------" crlf)
    (printout t "Apa jenis teknologi yang anda inginkan dari mobil listrik?" crlf)
    (printout t "[E: BEV (full baterai), P: PHEV (BBM dan baterai)]: ")
    (assert (jenis (read)))
    (printout t "Berapa range harga yang anda inginkan?" crlf)
    (printout t "[A: 240-650 juta, B: 651-900 juta, C: 901 juta - 3 miliar]: ")
    (assert (harga (read)))
    (printout t "Berapa battery range mobil yang anda inginkan?" crlf)
    (printout t "[1: 1-90 km, 2: 91-350 km, 3: 351-700 km ]: ")
    (assert (baterai (read)))
    (printout t "Berapa charging time mobil yang anda inginkan?" crlf)
    (printout t "[F: 30 menit-7 jam, S: 8-11 jam]: ")
    (assert (charging (read)))
)

(defrule hyundaiIonic
    (jenis E)
    (harga B)
    (baterai 3)
    (charging F)
    =>
    (assert (mobil hyundaiIonic))
    (printout t crlf "-----------------------REKOMENDASI--------------------------" crlf)
    (printout t "Mobil yang cocok dengan kriteria anda adalah Hyundai Ionic 5" crlf)
    (assert (ask again))
)

(defrule wulingAir
    (jenis E)
    (harga A)
    (baterai 2)
    (charging S) 
    =>
    (assert (mobil wulingAir))
    (printout t crlf "----------------------REKOMENDASI-------------------------" crlf)
    (printout t "Mobil yang cocok dengan kriteria anda adalah Wuling Air ev" crlf)
    (assert (ask again))
)

(defrule teslaModel
    (jenis E)
    (harga C)
    (baterai 3)
    (charging F|S)
    =>
    (assert (mobil teslaModel))
    (printout t crlf "----------------------REKOMENDASI-------------------------" crlf)
    (printout t "Mobil yang cocok dengan kriteria anda adalah Tesla Model 3" crlf)
    (assert (ask again))
)

(defrule bmwI
    (jenis E)
    (harga C)
    (baterai 3)
    (charging F)
    =>
    (assert (mobil bmwI))
    (printout t crlf "-------------------REKOMENDASI---------------------" crlf)
    (printout t "Mobil yang cocok dengan kriteria anda adalah BMW i4" crlf)
    (assert (ask again))
)

(defrule lexusUX
    (jenis E)
    (harga C)
    (baterai 2)
    (charging F|S)
    =>
    (assert (mobil lexusUX))
    (printout t crlf "----------------------REKOMENDASI------------------------" crlf)
    (printout t "Mobil yang cocok dengan kriteria anda adalah Lexus UX300e" crlf)
    (assert (ask again))
)

(defrule mitsubishiOutlander
    (jenis P)
    (harga B|C)
    (baterai 1)
    (charging F)
    =>
    (assert (mobil mitsubishiOutlander))
    (printout t crlf "----------------------------REKOMENDASI-------------------------------" crlf)
    (printout t "Mobil yang cocok dengan kriteria anda adalah Mitsubishi Outlander PHEV" crlf)
    (assert (ask again))
)

(defrule error
    (input Data)
    (not (mobil hyundaiIonic|wulingAir|teslaModel|bmwI|lexusUX|mitsubishiOutlander))
    =>
    (printout t crlf "-----------------------------REKOMENDASI--------------------------------" crlf)
    (printout t "Tidak dapat memberikan rekomendasi mobil dengan kriteria yang anda pilih" crlf)
    (assert (ask again))
)

(defrule askagain
    (ask again)
    =>
    (printout t crlf "////////////////////////////////////////////////////////////////////////////////" crlf)
    (printout t crlf "Apakah anda ingin mencoba lagi? [y/n]: " crlf)
    (assert (decision (read)))
)

(defrule repeat
    (decision y)
    =>
    (retract *)
    (assert (again yes))
)

(defrule notRepeat
    (and (or (decision n) (not (decision y))))
    =>
    (printout t crlf "Terima kasih!" crlf)
    (halt)
)
//
//  Misc.swift
//  Itambah
//
//  Created by Sayed Zulfikar on 20/08/23.
//

import Foundation
import SwiftUI

let screenWidth : CGFloat = UIScreen.main.bounds.width
let screenHeight : CGFloat = UIScreen.main.bounds.height

let instructions = [
    "1. Saat mulai bermain, orangtua mengarahkan anak untuk menekan dadu, dan tunggu hingga angka keluar.",
    "2. Setelah angka pertama otomatis terlihat, arahkan anak untuk menekan bola-bola sesuai dengan jumlah angka.",
    "3. Bola akan berpindah ke bar di sebelah kanan dan orangtua arahkan anak untuk menghitung jumlah bola.",
    "4. Arahkan anak untuk menge-cek apakah jumlah bola sudah sesuai dengan angka pertama, dengan menekan tombol cek.",
    "5. Jika sudah benar, arahkan anak untuk melanjutkan langkah selanjutnya, dengan menekan dadu lagi.",
    "6. Setelah muncul angka kedua, ulangi langkah selanjutnya.",
    "7. Arahkan anak untuk menekan bola-bola sesuai dengan jumlah angka kedua.",
    "8. Arahkan anak untuk menge-cek apakah jumlah yang ditekan sudah sesuai dengan angka yang muncul kedua.",
    "9. Jika sudah benar, lanjutkan langkah dengan menghitung keseluruhan bola.",
    "10. Arahkan anak untuk memasukkan jumlah angka yang sesuai dengan total jumlah bola.",
    "11. Tekan tombol Selesai untuk menge-cek hasil akhir penjumlahan bola.",
    "12. Selamat bermain dan belajar!"
]

let hintMessages: [String] = [
    "Tekan dadu untuk memulai",
    "Tekan bola-bola di bawah dadu sejumlah angka yang tertera lalu tekan tombol \"Cek\"",
    "Tekan dadu lagi untuk melanjutkan",
    "Tekan bola-bola di bawah dadu sejumlah angka yang tertera lalu tekan tombol \"Cek\"",
    "Masukan jawaban penjumlahan pada kotak"
]

enum glow {
    case none
    case dice
    case dots
    case answer
}



# 📊 Data Science: Marketing Segmentation

Proyek ini bertujuan untuk melakukan segmentasi pelanggan menggunakan metode **K-Means** dan **K-Modes**. Segmentasi ini membantu dalam memahami kelompok pelanggan berdasarkan karakteristik dan perilaku mereka sehingga strategi pemasaran dapat lebih tepat sasaran dan efektif.

---

## 🎯 Tujuan Proyek

- Mengelompokkan pelanggan berdasarkan data demografis dan perilaku pembelian.  
- Menentukan jumlah cluster optimal dengan menggunakan **Elbow Method**.  
- Membandingkan hasil segmentasi antara metode **K-Means** dan **K-Modes**.  

---

## 🛠️ Teknologi dan Library yang Digunakan

- **Bahasa Pemrograman:** R  
- **Library Utama:**  
  - `ggplot2` — Visualisasi data dan Elbow Method  
  - `klaR` — Implementasi clustering K-Modes  
  - Base R — Manipulasi data dan clustering K-Means  

---

## 🚀 Alur Analisis

1. **Persiapan Data**  
  - Mengimpor data pelanggan dari sumber DQLab.  
  - Melakukan konversi variabel kategorikal menjadi numerik (untuk metode K-Means).  
  - Melakukan normalisasi nilai belanja tahunan.  

2. **Clustering dengan K-Means**  
  - Melakukan evaluasi nilai K (1–10) dengan metode Elbow untuk menentukan jumlah cluster optimal.  
  - Melatih model K-Means dan menambahkan hasil segmentasi ke dataset.  

3. **Prediksi untuk Pelanggan Baru**  
  - Simulasi data pelanggan baru dan prediksi cluster dengan menghitung jarak ke centroid terdekat.  

4. **Clustering dengan K-Modes**  
  - Melakukan segmentasi langsung pada variabel kategorikal menggunakan K-Modes.  
  - Menambahkan hasil cluster K-Modes ke dataset.  

---

## 📈 Visualisasi

Plot **Elbow Method** untuk menentukan jumlah cluster optimal:  
Within Cluster Sum of Squares (WSS) vs Jumlah Cluster  
Titik elbow adalah jumlah cluster di mana penurunan WSS mulai melandai.  

*Grafik ini dihasilkan menggunakan `ggplot2` setelah menjalankan skrip.*  

---

## 📂 Dataset

- **Sumber Data:** [DQLab Academy](https://dqlab.id)  
- **File:** [`customer_segments.txt`](https://storage.googleapis.com/dqlab-dataset/customer_segments.txt)  
- **Fitur yang Digunakan:** Jenis Kelamin, Umur, Profesi, Tipe Residen, Nilai Belanja Setahun  

---

## ✅ Output Akhir

Dataset hasil analisis akan memiliki dua kolom tambahan sebagai hasil segmentasi:  
- `cluster_kmeans`: Label cluster dari model K-Means  
- `cluster_kmodes`: Label cluster dari model K-Modes  

---

## 🔍 Contoh Hasil Prediksi

Contoh output prediksi pelanggan baru:  
`Pelanggan baru diprediksi masuk ke cluster: 3`  

---

## ⚠️ Lisensi dan Hak Cipta

- Data ini merupakan milik **DQLab Academy**.  
- Digunakan **hanya untuk keperluan edukasi dan pembelajaran**.  
- Dilarang menyebarluaskan data atau menggunakan di luar konteks yang diizinkan oleh pemilik data.  

---

## 👨‍💻 Tentang Pengembang

**Yoga Pratama**  
📧 Email: [yp170090@gmail.com](mailto:yp170090@gmail.com)  
🔗 LinkedIn: [linkedin.com/in/yoga-pratama-923202349](https://linkedin.com/in/yoga-pratama-923202349)  
🐱 GitHub: [github.com/Yongsjasjos](https://github.com/Yongsjasjos)  

---

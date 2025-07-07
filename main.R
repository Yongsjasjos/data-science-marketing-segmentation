#instal package
# install.packages("klaR") (silahkan di instal jika belum)
# Load Library
library(ggplot2)
library(klaR)  # Library untuk K-Modes (clustering data kategorikal)

# =======================
# 1. Persiapan Data
# =======================
pelanggan <- read.csv("https://storage.googleapis.com/dqlab-dataset/customer_segments.txt", sep="\t")

# Konversi kolom kategorikal menjadi numerik untuk keperluan K-Means
pelanggan_matrix <- data.matrix(pelanggan[c("Jenis.Kelamin", "Profesi", "Tipe.Residen")])
pelanggan <- data.frame(pelanggan, pelanggan_matrix)

# Simpan referensi kategori asli dan hasil konversinya (optional, untuk interpretasi)
Profesi <- unique(pelanggan[c("Profesi","Profesi.1")])
Jenis.Kelamin <- unique(pelanggan[c("Jenis.Kelamin","Jenis.Kelamin.1")])
Tipe.Residen <- unique(pelanggan[c("Tipe.Residen","Tipe.Residen.1")])

# Normalisasi nilai belanja (dalam jutaan rupiah)
pelanggan$NilaiBelanjaSetahun <- pelanggan$NilaiBelanjaSetahun / 1000000

# Pilih fitur yang digunakan untuk clustering
field_yang_digunakan = c("Jenis.Kelamin.1", "Umur", "Profesi.1", "Tipe.Residen.1", "NilaiBelanjaSetahun")

# =======================
# 2. Clustering dengan K-Means
# =======================
set.seed(1)
sse <- sapply(1:10, function(param_k){
  kmeans(pelanggan[field_yang_digunakan], param_k, nstart=25)$tot.withinss
})

# =======================
# 3. Menentukan Jumlah Cluster Terbaik (Elbow Method)
# =======================
jumlah_cluster_max <- 10
ssdata = data.frame(cluster=c(1:jumlah_cluster_max), sse)

ggplot(ssdata, aes(x=cluster, y=sse)) +
  geom_line(color="red") + 
  geom_point() +
  ylab("Within Cluster Sum of Squares") + 
  xlab("Jumlah Cluster") +
  geom_text(aes(label=format(round(sse, 2), nsmall = 2)), hjust=-0.2, vjust=-0.5) +
  scale_x_discrete(limits=c(1:jumlah_cluster_max))

# =======================
# 4. Pemaketan Model K-Means
# =======================
# Misalnya setelah melihat grafik elbow, kita pilih jumlah cluster terbaik = 4
jumlah_cluster_optimal <- 4
model_kmeans <- kmeans(pelanggan[field_yang_digunakan], jumlah_cluster_optimal, nstart=25)

# Tambahkan hasil cluster ke data
pelanggan$cluster_kmeans <- model_kmeans$cluster

# =======================
# 5. Mengoperasionalkan Model K-Means (contoh prediksi data baru)
# =======================
# Simulasi data pelanggan baru
pelanggan_baru <- data.frame(
  Jenis.Kelamin.1 = 1,  # Laki-laki (misalnya)
  Umur = 30,
  Profesi.1 = 2,       
  Tipe.Residen.1 = 1,   
  NilaiBelanjaSetahun = 3.5  # dalam jutaan
)

# Prediksi cluster pelanggan baru dengan model yang sudah dilatih
# Caranya: hitung jarak ke centroid dan ambil yang paling dekat
jarak_ke_centroid <- apply(model_kmeans$centers, 1, function(centroid){
  sum((pelanggan_baru - centroid)^2)
})
cluster_prediksi <- which.min(jarak_ke_centroid)
cat("Pelanggan baru diprediksi masuk ke cluster:", cluster_prediksi, "\n")

# =======================
# 6. Alternatif: Clustering dengan K-Modes (untuk data kategorikal)
# =======================
# Pilih hanya fitur kategorikal
data_kategorikal <- pelanggan[c("Jenis.Kelamin", "Profesi", "Tipe.Residen")]

# Jalankan K-Modes untuk 4 cluster
set.seed(1)
kmodes_model <- kmodes(data_kategorikal, modes=4, iter.max=10)

# Tambahkan hasil clustering K-Modes ke data
pelanggan$cluster_kmodes <- kmodes_model$cluster

# Lihat hasil cluster K-Modes
table(pelanggan$cluster_kmodes)

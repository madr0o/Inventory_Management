**Deskripsi Proyek**
Proyek ini bertujuan untuk membangun sistem manajemen pesanan dan inventaris yang terintegrasi dengan menggunakan database relasional. Sistem ini mencakup pengelolaan pesanan, produk, pelanggan, dan karyawan untuk memastikan kelancaran operasional dan manajemen stok yang efisien.

**Struktur Database**
Struktur database dirancang untuk mendukung berbagai entitas utama seperti customers, orders, products, employees, order details, payments, categories, dan suppliers. Berikut adalah tabel-tabel utama yang digunakan:

- Customers:
Menyimpan informasi pelanggan seperti customer_id, customer_name, customer_email, dan customer_phone_number.
- Products:
Menyimpan informasi produk seperti product_id, product_name, category_id, supplier_id, stock_quantity, dan price_per_unit.
- Orders:
Menyimpan data pesanan seperti order_id, customer_id, order_date, total_amount, order_status, shipping_address, payment_method, dan employee_id yang memproses pesanan.
- Employees:
Menyimpan informasi karyawan yang bertanggung jawab untuk memproses pesanan, seperti employee_id, employee_name, employee_role, dan employee_phone_number.
- Order Details:
Menyimpan detail setiap pesanan, termasuk order_detail_id, order_id, product_id, quantity, dan price_per_unit.
- Suppliers:
Menyimpan informasi supplier untuk product.
- Categories:
Menyimpan informasi untuk membedakan produk-produk yang ada.
- Payments:
Menyimpan informasi pembayaran yang dilakukan oleh customers untuk setiap transaksi.


**Relasi Antar Tabel**
- Customers terhubung dengan Orders melalui customer_id.
- Products terhubung dengan Order Details melalui product_id.
- Orders terhubung dengan Order Details melalui order_id.
- Employees terhubung dengan Orders melalui employee_id untuk melacak karyawan yang bertanggung jawab memproses setiap pesanan.

**Enumerasi**
Untuk menjaga konsistensi data, beberapa kolom menggunakan enumerasi (enum):

- order_status_enum
Berisi nilai seperti 'Diproses', 'Dikirim', dan 'Selesai' untuk menunjukkan status pesanan.
- payment_method_enum
Berisi nilai seperti 'Cash', 'Transfer', dan 'Debit' untuk mencatat metode pembayaran yang dipilih oleh pelanggan.
- payment_status_enum
Berisi nilai seperti 'Belum lunas' dan 'Lunas' untuk menunjukkan informasi status pembayaran.

**Pengujian**

Pengujian dilakukan dengan memasukkan data uji ke setiap tabel dan menjalankan query untuk memastikan hasilnya sesuai. Pengujian ini meliputi:

- Memastikan referensi antar tabel berjalan dengan baik (misalnya, pesanan terkait dengan pelanggan dan produk yang valid).
- Memverifikasi enumerasi untuk status pesanan dan metode pembayaran.
- Menguji integritas data dengan foreign key dan check constraints.

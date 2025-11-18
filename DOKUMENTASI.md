# Dokumentasi Aplikasi Task Management

## Login
Username: `admin` | Password: `123`

## File dan Fungsi

| File | Fungsi |
|------|--------|
| `main.dart` | Entry point, set route awal ke login |
| `routes.dart` | Konfigurasi navigasi (login, home, task-form) |
| `storage.dart` | Service untuk simpan/baca data login dan tugas (SharedPreferences) |
| `login_page.dart` | Form login dengan validasi |
| `home_page.dart` | Halaman daftar tugas dengan CRUD operations |
| `task_form_page.dart` | Form sederhana untuk menambah/edit tugas |
| `sidemenu.dart` | Drawer menu untuk navigasi dan logout |

## Alur Aplikasi

1. Buka app → Login page
2. Input username/password → Validasi → Simpan ke storage → Home (Daftar Tugas)
3. Home → Lihat daftar tugas, tambah/edit/hapus tugas, tandai selesai
4. Side menu → Akses Daftar Tugas dan Logout
5. Logout → Hapus storage → Kembali ke Login

## Konsep

- **Named Routes**: Navigasi menggunakan string constants
- **Local Storage**: SharedPreferences untuk session management dan penyimpanan tugas
- **Navigation**: `pushNamed()`, `pushReplacementNamed()`, `pushNamedAndRemoveUntil()`
- **CRUD Operations**: Create, Read, Update, Delete untuk manajemen tugas

## Fitur Utama

- **Routes**: Sistem navigasi dengan named routes
- **Side Menu**: Drawer menu dengan akses cepat ke semua halaman
- **Login**: Autentikasi dengan validasi username/password
- **Local Storage**: Penyimpanan data login dan tugas secara persisten
- **Task Management**: 
  - Tambah tugas baru (hanya judul)
  - Edit tugas yang sudah ada
  - Hapus tugas
  - Tandai tugas sebagai selesai/pending

## Method Penting

**Storage:**
- `saveLogin(username)` - Simpan data login
- `getUsername()` - Ambil username dari storage
- `checkLogin()` - Cek status login
- `logout()` - Hapus data login
- `getTasks()` - Ambil semua tugas
- `addTask(task)` - Tambah tugas baru
- `updateTask(task)` - Update tugas yang ada
- `deleteTask(taskId)` - Hapus tugas
- `saveTasks(tasks)` - Simpan semua tugas

**Task Model:**
- `Task` - Model data sederhana dengan id, title, isCompleted
- `toJson()` - Konversi Task ke JSON
- `fromJson()` - Konversi JSON ke Task
- `copyWith()` - Buat copy Task dengan perubahan

**Navigation:**
- `Navigator.pushNamed()` - Tambah route baru
- `Navigator.pushReplacementNamed()` - Ganti route saat ini
- `Navigator.pushNamedAndRemoveUntil()` - Hapus semua route sebelumnya

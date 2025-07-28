<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');
header('Content-Type: application/json');

require_once "db_config.php";

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'msg' => 'Metode tidak diizinkan']);
    exit;
}

// Ambil data input
$nama = $_POST['nama'] ?? '';
$nohp = $_POST['nohp'] ?? '';
$email = $_POST['email'] ?? '';
$tanggal = $_POST['tanggal'] ?? '';
$prodi = $_POST['prodi'] ?? '';
$dosenpembimbing = $_POST['dosenpembimbing'] ?? '';
$pembimbinglapangan = $_POST['pembimbinglapangan'] ?? '';
$keterangan = $_POST['keterangan'] ?? '';
$pdfPath = null;

// Validasi input sederhana
if (!$nama || !$nohp || !$email || !$tanggal || !$prodi || !$dosenpembimbing || !$pembimbinglapangan || !$keterangan) {
    echo json_encode(['success' => false, 'msg' => 'Semua field wajib diisi']);
    exit;
}

// Upload file PDF
if (isset($_FILES['file_pdf'])) {
    $file = $_FILES['file_pdf'];
    $uploadDir = 'uploads/';
    $ext = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));

    if ($ext !== 'pdf') {
        echo json_encode(['success' => false, 'msg' => 'File harus berformat PDF']);
        exit;
    }

    if (!file_exists($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    $safeFilename = uniqid() . '_' . preg_replace('/[^a-zA-Z0-9_\.-]/', '_', basename($file['name']));
    $targetFile = $uploadDir . $safeFilename;

    if (!move_uploaded_file($file['tmp_name'], $targetFile)) {
        echo json_encode(['success' => false, 'msg' => 'Gagal mengunggah file PDF']);
        exit;
    }

    $pdfPath = $targetFile;
}

try {
    $stmt = $pdo->prepare("
        INSERT INTO kegiatan_pkl 
        (nama, nohp, email, tanggal, prodi, dosenpembimbing, pembimbinglapangan, keterangan, file_pdf)
        VALUES 
        (:nama, :nohp, :email, :tanggal, :prodi, :dosenpembimbing, :pembimbinglapangan, :keterangan, :file_pdf)
    ");

    $stmt->execute([
        ':nama' => $nama,
        ':nohp' => $nohp,
        ':email' => $email,
        ':tanggal' => $tanggal,
        ':prodi' => $prodi,
        ':dosenpembimbing' => $dosenpembimbing,
        ':pembimbinglapangan' => $pembimbinglapangan,
        ':keterangan' => $keterangan,
        ':file_pdf' => $pdfPath
    ]);

    echo json_encode(['success' => true, 'msg' => 'Laporan berhasil dikirim']);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'msg' => 'Database error: ' . $e->getMessage()]);
}

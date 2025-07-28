<?php
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Credentials: true');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization');
header('Content-Type: application/json; charset=UTF-8');

require_once "db_config.php"; // Pastikan file ini sudah benar

$postjson = json_decode(file_get_contents('php://input'), true);
$aksi = isset($postjson['aksi']) ? strip_tags($postjson['aksi']) : null;

if (!$aksi) {
    echo json_encode(['success' => false, 'msg' => 'Aksi tidak dikirim']);
    exit;
}

switch ($aksi) {

    // ✅ TAMBAH DATA LAPORAN PKL
    case "add_register":
        try {
            $stmt = $pdo->prepare("
                INSERT INTO kegiatan_pkl 
                (nama, nohp, email, tanggal, prodi, dosenpembimbing, pembimbinglapangan, keterangan)
                VALUES (:nama, :nohp, :email, :tanggal, :prodi, :dosenpembimbing, :pembimbinglapangan, :keterangan)
            ");

            $stmt->execute([
                ':nama' => $postjson['nama'],
                ':nohp' => $postjson['nohp'],
                ':email' => $postjson['email'],
                ':tanggal' => $postjson['tanggal'],
                ':prodi' => $postjson['prodi'],
                ':dosenpembimbing' => $postjson['dosenpembimbing'],
                ':pembimbinglapangan' => $postjson['pembimbinglapangan'],
                ':keterangan' => $postjson['keterangan']
            ]);

            echo json_encode(['success' => true, 'msg' => 'Data berhasil ditambahkan']);
        } catch (PDOException $e) {
            echo json_encode(['success' => false, 'msg' => 'Gagal menambahkan data: ' . $e->getMessage()]);
        }
        break;

    // ✅ AMBIL DATA LAPORAN
    case "getdata":
        $start = isset($postjson['start']) ? (int)$postjson['start'] : 0;
        $limit = isset($postjson['limit']) ? (int)$postjson['limit'] : 50;

        try {
            $stmt = $pdo->prepare("SELECT * FROM kegiatan_pkl ORDER BY id DESC LIMIT :start, :limit");
            $stmt->bindParam(':start', $start, PDO::PARAM_INT);
            $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
            $stmt->execute();

            $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

            echo json_encode([
                'success' => true,
                'result' => $data
            ]);
        } catch (PDOException $e) {
            echo json_encode(['success' => false, 'msg' => 'Gagal mengambil data: ' . $e->getMessage()]);
        }
        break;

    // ❌ JIKA AKSI TIDAK VALID
    default:
        echo json_encode(['success' => false, 'msg' => 'Aksi tidak dikenali']);
        break;
        case "login_admin":
    $username = $postjson['username'];
    $password = $postjson['password'];

    try {
        $stmt = $pdo->prepare("SELECT * FROM admin WHERE username = :username AND password = :password");
        $stmt->execute([':username' => $username, ':password' => $password]);

        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            echo json_encode(['success' => true, 'msg' => 'Login berhasil']);
        } else {
            echo json_encode(['success' => false, 'msg' => 'Username atau password salah']);
        }
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'msg' => 'Kesalahan: ' . $e->getMessage()]);
    }
    break;

}

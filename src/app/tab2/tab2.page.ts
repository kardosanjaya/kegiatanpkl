import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastController } from '@ionic/angular';
import { PostProvider } from '../../providers/post-provider';
import { HttpClient } from '@angular/common/http';
import { IonicModule } from '@ionic/angular';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ExploreContainerComponentModule } from '../explore-container/explore-container.module';

@Component({
  selector: 'app-tab2',
  templateUrl: 'tab2.page.html',
  styleUrls: ['tab2.page.scss'],
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    ExploreContainerComponentModule
  ]
})
export class Tab2Page implements OnInit {

  nama: string = '';
  nohp: string = '';
  email: string = '';
  tanggal: string = '';
  prodi: string = '';
  dosenpembimbing: string = '';
  pembimbinglapangan: string = '';
  keterangan: string = '';

  pdfFile: File | null = null;
  pdfFileName: string = '';

  constructor(
    private router: Router,
    public toastController: ToastController,
    private postPvdr: PostProvider,
    private http: HttpClient
  ) { }

  ngOnInit() { }

  // 🔍 Tangkap file PDF
  onFileSelected(event: any) {
    const file: File = event.target.files[0];
    if (file && file.type === 'application/pdf') {
      this.pdfFile = file;
      this.pdfFileName = file.name;
    } else {
      alert('Mohon pilih file berformat PDF');
      event.target.value = '';
    }
  }

  // 📤 Upload semua data + PDF
  async uploadLaporan() {
    // Validasi form
    if (!this.nama || !this.nohp || !this.email || !this.tanggal || !this.prodi || !this.dosenpembimbing || !this.pembimbinglapangan || !this.keterangan) {
      const toast = await this.toastController.create({
        message: 'Mohon lengkapi semua form',
        duration: 2000
      });
      toast.present();
      return;
    }

    if (!this.pdfFile) {
      const toast = await this.toastController.create({
        message: 'File PDF belum dipilih',
        duration: 2000
      });
      toast.present();
      return;
    }

    // Buat form data
    const formData = new FormData();
    formData.append('aksi', 'add_register');
    formData.append('nama', this.nama);
    formData.append('nohp', this.nohp);
    formData.append('email', this.email);
    formData.append('tanggal', this.tanggal);
    formData.append('prodi', this.prodi);
    formData.append('dosenpembimbing', this.dosenpembimbing);
    formData.append('pembimbinglapangan', this.pembimbinglapangan);
    formData.append('keterangan', this.keterangan);
    formData.append('file_pdf', this.pdfFile, this.pdfFile.name);

    // Kirim ke backend
    this.http.post('https://kegiatanpkl.aplikasi.blog/upload_laporan.php', formData)
      .subscribe(async (res: any) => {
        if (res.success) {
          this.router.navigate(['/tab3']);
          const toast = await this.toastController.create({
            message: 'Laporan berhasil dikirim!',
            duration: 2000
          });
          toast.present();
        } else {
          const toast = await this.toastController.create({
            message: 'Gagal: ' + res.msg,
            duration: 2000
          });
          toast.present();
        }
      }, error => {
        alert('Terjadi kesalahan jaringan.');
        console.error(error);
      });
  }

}

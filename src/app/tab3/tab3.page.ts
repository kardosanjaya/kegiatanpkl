import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { IonicModule } from '@ionic/angular';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ExploreContainerComponentModule } from '../explore-container/explore-container.module';

@Component({
  selector: 'app-tab3',
  templateUrl: './tab3.page.html',
  styleUrls: ['./tab3.page.scss'],
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    ExploreContainerComponentModule
  ]
})
export class Tab3Page implements OnInit {

  username: string = '';
  password: string = '';
  isLoggedIn: boolean = false;
  tabState: 'login' | 'admin' = 'login';

  daftarkegiatan: any[] = [];

  constructor(private http: HttpClient) { }

  ngOnInit() {
    this.isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';
    this.tabState = this.isLoggedIn ? 'admin' : 'login';

    if (this.isLoggedIn) {
      this.getDataLaporanPkl();
    }
  }

  // ✅ Login Dosen
  login() {
    this.http.post('https://kegiatanpkl.aplikasi.blog/action.php', {
      aksi: 'login_admin',
      username: this.username,
      password: this.password
    }).subscribe(
      (res: any) => {
        if (res.success) {
          localStorage.setItem('isLoggedIn', 'true');
          this.isLoggedIn = true;
          this.tabState = 'admin';
          this.getDataLaporanPkl();
          alert('Login berhasil!');
        } else {
          alert('Login gagal: ' + res.msg);
        }
      },
      (err) => {
        alert('Terjadi kesalahan saat login.');
        console.error(err);
      }
    );
  }

  // ✅ Logout
  logout() {
    localStorage.removeItem('isLoggedIn');
    this.isLoggedIn = false;
    this.tabState = 'login';
    this.username = '';
    this.password = '';
  }

  // ✅ Ambil data laporan dari server
  getDataLaporanPkl() {
    this.http.post('https://kegiatanpkl.aplikasi.blog/action.php', {
      aksi: 'getdata'
    }).subscribe(
      (res: any) => {
        if (res.success) {
          this.daftarkegiatan = res.result;
        } else {
          alert('Gagal mengambil data: ' + res.msg);
        }
      },
      (err) => {
        alert('Terjadi kesalahan saat mengambil data laporan.');
        console.error(err);
      }
    );
  }

  // ✅ Lihat file PDF
  lihatPDF(filePath: string) {
    const fullUrl = `https://kegiatanpkl.aplikasi.blog/${filePath}`;
    window.open(fullUrl, '_blank');
  }

}

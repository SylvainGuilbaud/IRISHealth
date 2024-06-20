import {MediaMatcher} from '@angular/cdk/layout';
import { ChangeDetectorRef, Component, Inject, OnDestroy } from '@angular/core';
import { DOCUMENT } from '@angular/common';
import { Router } from '@angular/router';
import { StorageService } from './services/storage.service';
import { AuthService } from './services/auth.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnDestroy{
    mobileQuery: MediaQueryList;
    title = 'workflow-ui';

    constructor(@Inject(DOCUMENT) public document: Document,
        public storageService: StorageService,
        public authService: AuthService,
        changeDetectorRef: ChangeDetectorRef, 
        media: MediaMatcher,
        private router: Router
    )
    {
        this.mobileQuery = media.matchMedia('(max-width: 600px)');
        this._mobileQueryListener = () => changeDetectorRef.detectChanges();
        this.mobileQuery.addEventListener("change",this._mobileQueryListener);
    }

    private _mobileQueryListener: () => void;

    ngOnDestroy(): void {
        this.mobileQuery.removeEventListener("change", this._mobileQueryListener);
    }

    redirectLogin(): void {
      this.router.navigate(['login'])
    }

    logout(): void {
      this.authService.logout().subscribe({
        next: data => {
          this.storageService.clean()
          this.router.navigate(['login']);
        },
        error: err => {
        }
      });
    }
}

import { Component } from '@angular/core';
import { UntypedFormControl, UntypedFormGroup, Validators } from '@angular/forms';
import { AuthService } from '../services/auth.service';
import { StorageService } from '../services/storage.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {

  isLoggedIn = false;
  
  public loginForm = new UntypedFormGroup({
    Username: new UntypedFormControl('', {nonNullable: true, validators: [Validators.required]}),
    Password: new UntypedFormControl('', {nonNullable: true, validators: [Validators.required]})
  })

  constructor(private authService: AuthService, 
    private storageService: StorageService,
    private router: Router) { }

  ngOnInit() {
    this.loginForm.reset();
  }
  
  get username() {
    return this.loginForm.get('Username');
  }

  get password() {
    return this.loginForm.get('Password');
  }

  onSubmit(): void {

    this.authService.login(this.username?.value, this.password?.value).subscribe({
      next: data => {
        this.storageService.save(data.access_token, this.username?.value)
        this.router.navigate(['tasks']);
      },
      error: err => {
      }
    });
  }
}

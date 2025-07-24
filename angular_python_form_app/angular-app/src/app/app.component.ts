import { Component } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
})
export class AppComponent {
  formData = {
    prenom: '',
    nom: '',
    sex: '',
    dob: ''
  };

  constructor(private http: HttpClient) {}

  onSubmit() {
    this.http.post('http://localhost:5000/api/envoi', this.formData)
      .subscribe(response => {
        console.log('Réponse du serveur :', response);
      });
  }
}
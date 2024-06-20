import { Injectable } from '@angular/core';

const USER_KEY = 'auth-user';
const USER_NAME = 'username';

@Injectable({
  providedIn: 'root'
})
export class StorageService {
  constructor() {}

  clean(): void {
    window.sessionStorage.removeItem(USER_KEY);
    window.sessionStorage.removeItem(USER_NAME);
  }

  save(userToken: string, username: string): void {
    window.sessionStorage.setItem(USER_KEY, userToken);
    window.sessionStorage.setItem(USER_NAME, username);
  }
  
  public isLoggedIn(): boolean {
    const user = window.sessionStorage.getItem(USER_KEY);
    if (user) {
      return true;
    }

    return false;
  }

  public getToken(): string {
    const user = window.sessionStorage.getItem(USER_KEY);
    if (user) {
      return user;
    }
    else {
      return "";
    }
  }

  public getUsername(): string {
    const username = window.sessionStorage.getItem(USER_NAME);
    if (username) {
      return username;
    }
    else {
      return "";
    }
  }
}
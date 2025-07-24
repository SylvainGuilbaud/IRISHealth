import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

const IRIS_API = 'api/workflow/';

let httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable({
  providedIn: 'root'
})
export class IrisService {

  constructor(private http: HttpClient) { }

  getTasks(): Observable<any> {
    return this.http.get<Response>(
      IRIS_API + 'getTasks', httpOptions
    )
  }

  saveTask(task: any): Observable<any> {
    return this.http.post<Response>(
      IRIS_API + 'saveTask', task
    )
  }
}

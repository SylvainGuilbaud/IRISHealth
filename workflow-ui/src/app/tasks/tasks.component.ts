import { Component } from '@angular/core';
import { IrisService } from '../services/iris.service';

@Component({
  selector: 'app-tasks',
  templateUrl: './tasks.component.html',
  styleUrls: ['./tasks.component.scss']
})
export class TasksComponent {

  public loading = true;
  public tasks: any[] = [];

  constructor(private irisService: IrisService) {
    this.getTasks();
  }

  getTasks()
  {
    this.tasks = [];
    this.irisService.getTasks().subscribe({
      next: res => {  
        this.loading = false;
        for (var task of res) {
          this.tasks.push(task);
        }
        if (this.tasks.length == 0) {
          this.tasks.push({"actions":"","message":"No tasks assigned to you","priority":"0","subject":"No pending task","creation":"","id":""})
        }
      },
      error: err => {
        console.error(JSON.stringify(err));
      }
    });
  }


  splitActions(actionsString: String): Array<String>
  {
    return actionsString.split(",");
  }

  onAction(id: String, action: String)
  {
    const task = {
      id: id,
      action: action
    };
    this.irisService.saveTask(task).subscribe({
      next: res => { 
        if (res.result === "success"){
          this.getTasks();
        }
        else {
          alert("Error!")
        }
      },
      error: err => {
        console.error(JSON.stringify(err));
      }
    });
  }
}

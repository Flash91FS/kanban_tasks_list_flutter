# kanban_tasks_list_flutter

A Kanban board App that gives the functionality to create Tasks and manage them in different phases as well as track their progress time.

### Setup and Installation

1. **Clone the repository**:

   ```sh
   git clone https://github.com/Flash91FS/kanban_tasks_list_flutter.git
   cd kanban_tasks_list_flutter

2. **Install dependencies**:

   ```sh
   flutter pub get
   
3. **Setup Environment**:
   
    Add `dev.env` file to the project root folder, and make sure that `BASE_API_URL` `API_TOKEN` and other necessary key-value pairs are added in it.
    Without this file or the key-value pairs in it, the App will NOT work.
  - Check `environment_settings.dart` file in root directory to see what key-value pairs are required.
  - The Project and Sections are already created in Todoist console, and their IDs are also already added in `dev.env` file so, that's all you need to add in the root directory.
 
4. **Setup firebase**:

  - Setup project in Firebaase console and create Web, iOS and Android apps
  - Download `google-services.json` and `GoogleService-Info.plist` files and paste the in android and ios folders as specified in firebase console
  - Add / Update `fiebase_options.dart` file with API keys etc for targets: Web, iOS and Android

For Further Help with Setup process, feel free to contact me on my [Linkedin](https://www.linkedin.com/in/faizan-shergill-bb2a5b57/) profile.


### Features:

1. **Kanban Board**:
   
    - A kanban board for tasks, where you can Add, Edit, Delete, and Move tasks between different columns (sections) i.e. "To Do", "In Progress", "Done".
    - Task Details page is added to show details of each task, that you can access by clicking on any task.
    - Post a comment for a Task, and get the list of all Comments for each task in its Task-Details-View
    - All these Task features, i.e. Add, Edit, Delete, and Move as well post Comments, are synced with Todoist console, so these changes will be reflected over there in runtime on every successful API call.
   
2. **TimeTracking Function**: 

    - Time Tracking feature is added to track time and progress for tasks that are in "In Progress" section.
    - To start Time Tracking, you have to click on the "Start Time Tracking" button in Task Details page. Note that the task has to be present in "In Progress" section for this, to make it close to real life example, when Time Tracking for tasks that are in progress
    - To stop Time Tracking, you can either click on the "Start Time Tracking" button in Task Details page, or moving the Task out of "In Progress" section to any other section will also pause/stop the Task's Time Tracking.


### Screenshots: 
<br><br>
<img width="996" alt="Screenshot 2024-07-02 at 7 50 31 AM" src="https://github.com/Flash91FS/kanban_tasks_list_flutter/assets/15036751/364de7b5-7fad-48fd-877d-ab8d20fb54c3"><br><br>

<img width="994" alt="Screenshot 2024-07-02 at 7 49 42 AM" src="https://github.com/Flash91FS/kanban_tasks_list_flutter/assets/15036751/6ef81b95-3b57-4b82-ab62-a2da545b249f"><br><br>

<img width="997" alt="Screenshot 2024-07-02 at 7 51 26 AM" src="https://github.com/Flash91FS/kanban_tasks_list_flutter/assets/15036751/35d64416-f73f-42e8-b7c8-11978adc24cc"><br><br>

<img width="997" alt="Screenshot 2024-07-02 at 7 51 42 AM" src="https://github.com/Flash91FS/kanban_tasks_list_flutter/assets/15036751/24ba30a8-b832-4e36-ab45-39ac6f1cd12f"><br><br>




    

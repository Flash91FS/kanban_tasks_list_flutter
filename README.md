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
 
5. **Setup firebase**:

  - Setup project in Firebaase console and create Web, iOS and Android apps
  - Download `google-services.json` and `GoogleService-Info.plist` files and paste the in android and ios folders as specified in firebase console
  - Add / Update `fiebase_options.dart` file with API keys etc for targets: Web, iOS and Android

For Further Help with Setup process, feel free to contact me on my [Linkedin](https://www.linkedin.com/in/faizan-shergill-bb2a5b57/) profile.


### Features:

1. **Kanban Board**:
   
    - A kanban board for tasks, where you can Add, Edit, Delete, and Move tasks between different columns (sections) i.e. "To Do", "In Progress", "Done".
    - All these Task features (Add, Edit, Delete, and Move) and synced with Todoist console, so these changes will be reflected over there in runtime on every successful API call.
    - Task Details page is added to show deatils of each task, that you can access by clicking on any task.
   
3. **TimeTracking Function**: 

    - Time Tracking feature is added to track time and progress for tasks that are in "In Progress" section.
    - To start Time Tracking, you have to click on the "Start Time Tracking" button in Task Details page. Note that the task has to be present in "In Progress" section for this, to make it close to real life example, when Time Tracking for tasks that are in progress
    - To stop Time Tracking, you can either click on the "Start Time Tracking" button in Task Details page, or moving the Task out of "In Progress" section to any other section will also pause/stop the Task's Time Tracking.

    

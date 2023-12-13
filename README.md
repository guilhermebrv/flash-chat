# Flash Chat Messaging App

This project is a culmination of the skills acquired during the ["iOS & Swift - The Complete iOS App Development Bootcamp"](https://www.udemy.com/course/ios-13-app-development-bootcamp) by Angela Yu on Udemy.

## Project Overview

<img src="(https://github.com/guilhermebrv/flash-chat/assets/104163003/0c517b43-d15f-4c34-a52d-9420739c79ca)" width="180" height="400" />
<img src="(https://github.com/guilhermebrv/flash-chat/assets/104163003/d260c94e-37f2-4169-bd74-eaef6c5ad37a)" width="180" height="400" />
<img src="(https://github.com/guilhermebrv/flash-chat/assets/104163003/05ef67a5-6843-4da2-a9fb-efda11ef98d8)" width="180" height="400" />

## Key Features

- **Swift Package Manager + Firebase:** Utilized the Swift Package Manager to integrate Firebase services, enabling user authentication (ensuring secure user registration, login, and logout) and cloud-based storage for message data (storing messages, senders, and timestamps, facilitating real-time data synchronization and storage). Error alerts are displayed in case of authentication issues.

- **Messages on a Table View:** Utilized table view cells to display messages, senders, and timestamps, providing a structured and organized way to view and interact with the message data.

- **Customized Cell Sizing Logic:** Implemented a dynamic cell sizing logic to ensure each message cell adapts to its content and respect constraints, enhancing the overall user interface.

- **IQKeyboardManager Integration:** Integrated IQKeyboardManager using Swift Package Manager to handle keyboard interactions seamlessly while users input their messages.

- **MVVM Design Pattern with ViewCode:** Transformed the project architecture to adhere to the MVVM (Model-View-ViewModel) design pattern using ViewCode. This adaptation from the initial MVC (Model-View-Controller) and Storyboard structure in the course's project sketch resulted in a more organized and modular codebase.

## How to Use

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/guilhermebrv/flash-chat.git

2. **Open in Xcode:**
- Launch the project in Xcode and run it on your preferred iOS simulator or device.

3. **Explore and Calculate:**
- Register, log in, and log out securely using FirebaseAuth.
- Input messages, and witness real-time updates as the data syncs with Firebase Firestore.
- Experience a smooth and intuitive messaging interface with dynamic cell sizing and keyboard management.

## Acknowledgments
- Angela Yu - Udemy Instructor: Grateful for the comprehensive iOS development course that inspired and equipped me to develop this chat messaging app.

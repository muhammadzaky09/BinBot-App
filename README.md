# BinBot - Integrated Waste Management System


https://github.com/muhammadzaky09/BinBot-App/assets/88239996/3ba6f70c-226e-4962-9680-7dc3b2945752


BinBot is an innovative Waste Management System designed to work with the OrangePi IoT device and Android Flutter Application. It provides analytics about waste bins, facilitating efficient waste sorting and management. Developed using Flutter, Firebase, and TensorFlow, BinBot is a step towards smarter waste handling and sustainability. Utilizing machine learning and computer vision, BinBot can identify different types of waste and suggest the correct bin for disposal. This project aims to tackle *Goal 12: Responsible Consumption and Production* and to streamline waste management as well as support recycling efforts. <br>
The model is derived from pretrained DenseNet-121 model, a balanced solution between performance and accuracy. During training, the model is able to reach more than 90% in both validation and training accuracy.

## Features

- Real-time analytics of waste bin status.
- Notifications for waste bin levels.
- Waste classification guidance.
- Historical data analysis and reporting.

## Getting Started - Android App

To get a local copy up and running, follow these simple steps.

### Prerequisites

Ensure you have the following installed:
- Flutter 
- Dart 
- Android Studio or VS Code with Flutter plugin
- Git

### Installation

1. Clone the repository from GitHub:
   ```sh
   git clone https://github.com/your_username_/BinBot.git
   ```
2. Navigate to the project directory:
   ```sh
   cd BinBot-App
   ```
3. Install dependencies
   ```sh
   flutter pub get
   ```
4. Connect to Android device or emulator
5. Run the app
   ```sh
   flutter run
   ```
## Getting Started - IoT Device

### Requirements

To run BinBot, the following hardware components are required:

- Orange Pi 3B
- Webcam compatible with Orange Pi
- Monitor with HDMI input

### Dataset Obtained
#### Overview
![image](https://github.com/muhammadzaky09/BinBot-Waste-Classification-Model/assets/88239996/0ca8c14b-4b13-436f-99d1-afc3e5a76687)
![image](https://github.com/muhammadzaky09/BinBot-Waste-Classification-Model/assets/88239996/2afa7253-df0f-47d7-8c78-f1689018f35a)
```bash
organic count:  13966
inorganic count:  11111
b3 count:  10822
```
#### Links
- Garbage Classification - Kaggle https://www.kaggle.com/datasets/mostafaabla/garbage-classification
- TrashBox - GitHub https://github.com/nikhilvenkatkumsetty/TrashBox
- Waste Pictures (Medicine Waste) - Kaggle https://www.kaggle.com/datasets/wangziang/waste-pictures

### Tutorial

#### Setting Up the Hardware

1. Connect the Orange Pi to the monitor using an HDMI cable.
2. Connect the webcam to the Orange Pi via a USB port.

#### Configuring the Orange Pi

Follow the detailed instructions for setting up the Orange Pi 3B [here](http://www.orangepi.org/orangepiwiki/index.php/Orange_Pi_3B#Introduction_to_the_use_of_the_development_board).

#### Installing Prerequisites

On the Orange Pi, open a terminal and execute the following commands:

```bash
# Update the package list
sudo apt-get update

# Upgrade existing packages
sudo apt-get upgrade

# Install Python3
sudo apt-get install python3

# Install pip, the Python package installer
sudo apt-get install python3-pip

# Install OpenCV for Python
pip3 install opencv-python
```

## Contributing
We welcome contributions to BinBot. If you have suggestions or improvements, please fork the repository and create a pull request, or open an issue with the tag "enhancement".

## Contact
For issues, contact muhammad.zaky.firdaus@mail.ugm.ac.id

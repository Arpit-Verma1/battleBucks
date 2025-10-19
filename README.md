# BattleBucks - iOS Posts App

A modern iOS application built with SwiftUI that displays posts from JSONPlaceholder API with favorites functionality.

## 📱 Project Overview

BattleBucks is a clean, well-architected iOS app that demonstrates modern iOS development practices including MVVM architecture, Combine framework, and proper code organization. The app fetches posts from a public API and allows users to mark posts as favorites.

##

https://github.com/user-attachments/assets/7555c551-3082-4269-8eaa-21de6612342f

 🛠 Technical Specifications

### iOS & Xcode Requirements
- **iOS Deployment Target**: 18.5
- **Xcode Version**: 16.4
- **Swift Version**: 5.0
- **Minimum iOS Version**: iOS 18.5
- **Target Devices**: iPhone and iPad

### Dependencies
- **SwiftLint**: 1.1.1 (via Swift Package Manager)
  - Used for code quality and style enforcement
  - Integrated as a build tool plugin

## 🏗 Architecture Overview

### MVVM (Model-View-ViewModel) Pattern

The project follows the **MVVM architecture pattern** with the following key components:

#### **Models** (`/Models/`)
- **`PostModel.swift`**: Core data model representing a post
  - Conforms to `Identifiable`, `Codable`, `Equatable`, and `Hashable`
  - Includes custom encoding/decoding for API integration
  - Features favorite state management with immutable updates

#### **Views** (`/Core/` and `/Core/Posts/Views/`)
- **`HomeView.swift`**: Main container with TabView navigation
- **`PostListView.swift`**: Displays list of posts with search functionality
- **`PostDetailView.swift`**: Shows individual post details
- **`FavoritesView.swift`**: Displays favorited posts
- **Component Views**: Reusable UI components for loading, error states, and empty states

#### **ViewModels** (`/Core/Posts/ViewModels/`)
- **`PostViewModel.swift`**: Main business logic coordinator
  - Manages post data, search functionality, and favorites
  - Uses Combine for reactive programming
  - Handles state management and data transformation

#### **Services** (`/Services/`)
- **`PostService.swift`**: Data layer for API communication
  - Handles network requests and data fetching
  - Manages loading states and error handling
- **`NetworkManager.swift`**: Generic networking utility
  - Provides reusable network request functionality
  - Handles URL response validation and error management

## 📁 Project Structure Explanation

```
battleBucks/
├── battleBucks/
│   ├── Core/                          # Main app features
│   │   ├── Components/                # Reusable UI components
│   │   │   ├── Favourite/            # Favorite-related components
│   │   │   └── Posts/                # Post-related components
│   │   ├── Favourite/                # Favorites feature module
│   │   │   ├── View/                 # Favorites views
│   │   │   └── ViewModels/           # Favorites view models
│   │   ├── Posts/                    # Posts feature module
│   │   │   ├── ViewModels/           # Post view models
│   │   │   └── Views/                # Post views
│   │   └── HomeView.swift            # Main navigation container
│   ├── Models/                       # Data models
│   ├── Services/                     # Network and data services
│   └── Assets.xcassets/              # App assets and icons
├── .swiftlint.yml                    # SwiftLint configuration
└── battleBucks.xcodeproj/            # Xcode project files
```

### Why This Structure?

1. **Feature-Based Organization**: Each major feature (Posts, Favorites) has its own directory with views and view models
2. **Component Reusability**: Common UI components are separated for reuse across features
3. **Clear Separation of Concerns**: Models, Views, ViewModels, and Services are clearly separated
4. **Scalability**: Structure supports easy addition of new features without cluttering
5. **Maintainability**: Related files are grouped together, making navigation intuitive

## 🔧 Code Quality & SwiftLint

### SwiftLint Configuration
The project uses SwiftLint for maintaining code quality and consistency:

- **Line Length**: 150 characters warning, 200 characters error
- **File Length**: 500 lines warning, 800 lines error
- **Type Body Length**: 400 lines warning, 600 lines error
- **Function Body Length**: 300 lines warning, 400 lines error
- **Cyclomatic Complexity**: 12 warning, 20 error
- **Mandatory Trailing Commas**: Enabled for cleaner diffs
- **Unused Code Detection**: Analyzer rules for unused imports and declarations


## 🚀 Setup Instructions

### Prerequisites
1. **Xcode 16.4** or later
2. **iOS 18.5** or later (for deployment target)
3. **macOS** with Apple Silicon or Intel processor

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd battleBucks
   ```

2. **Open in Xcode**
   ```bash
   open battleBucks.xcodeproj
   ```

3. **Build and Run**
   - Select your target device or simulator
   - Press `Cmd + R` to build and run
   - The app will automatically fetch posts from the API


## 🔄 Data Flow

1. **App Launch**: `HomeView` initializes `PostViewModel`
2. **Data Fetching**: `PostViewModel` uses `PostService` to fetch data
3. **Network Request**: `PostService` uses `NetworkManager` for API calls
4. **Data Processing**: Raw JSON is decoded into `PostModel` objects
5. **State Updates**: Combine publishers notify views of data changes
6. **UI Updates**: SwiftUI views automatically update based on state changes

## 🧪 Testing Considerations

The architecture supports easy testing:
- **ViewModels**: Can be unit tested independently
- **Services**: Network layer can be mocked for testing
- **Models**: Data models are easily testable
- **Separation of Concerns**: Each layer can be tested in isolation

## 📝 Future Enhancements

- Unit and UI tests implementation
- Core Data integration for offline support
- Infinite scrolling for large datasets
- User authentication and personal favorites
- Dark mode support

---

**Created by**: Arpit Verma  
**Date**: October 2025  

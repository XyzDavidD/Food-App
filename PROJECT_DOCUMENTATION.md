# Food App - Frontend Documentation

## 🎯 Project Overview

This is a premium food tracking application built with SwiftUI, designed to feel expensive, modern, and incredibly polished. The app follows Apple Design Award standards with exceptional attention to detail, generous white space, perfect alignment, and smooth animations.

## 📱 Current Implementation Status

### ✅ **Completed Features**
- **Onboarding Flow** (3 screens with premium design)
- **Authentication System** (Login, Signup, Forgot Password)
- **Navigation System** (5-tab bottom navigation with floating center button)
- **Dashboard/Homepage** (Analytics and meal history)
- **Profile Page** (User settings and actions)
- **Design System** (Centralized colors, typography, spacing, components)

### 🚧 **Future Development**
- AI Chat functionality (center floating button)
- Recipe management system
- Food scanning features
- Data persistence and backend integration

## 🏗️ Project Structure

```
Food App New/
├── Food_App_NewApp.swift          # Main app entry point
├── ContentView.swift              # Default SwiftUI view (unused)
├── Core/                          # Design system and shared components
│   ├── Colors.swift              # Color palette definitions
│   ├── Typography.swift          # Font system definitions
│   ├── Spacing.swift             # Consistent spacing values
│   ├── Components/                # Reusable UI components
│   │   ├── CustomTextField.swift # Custom text input component
│   │   ├── PrimaryButton.swift   # Primary action button
│   │   ├── SecondaryButton.swift  # Secondary action button
│   │   └── TwoToneBackground.swift # Two-tone background component
│   └── Extensions/
│       └── HapticFeedback.swift  # Haptic feedback utilities
├── Features/                      # Main app features
│   ├── Onboarding/
│   │   └── OnboardingView.swift   # 3-screen onboarding flow
│   ├── Authentication/
│   │   ├── AuthenticationView.swift    # Main auth container
│   │   └── ForgotPasswordView.swift    # Password reset screen
│   ├── Navigation/
│   │   └── MainTabView.swift      # Bottom navigation system
│   └── Tabs/                      # Individual tab screens
│       ├── HomeView.swift         # Dashboard/analytics page
│       ├── ScanView.swift         # Food scanning (placeholder)
│       ├── RecipesView.swift      # Recipe management (placeholder)
│       └── ProfileView.swift     # User profile and settings
└── Assets.xcassets/               # App icons and assets
```

## 🎨 Design System

### **Color Palette**
```swift
Primary Green:     #79BE70 (Strategic use only)
Background:        #FFFFFF (Pure white)
Text Dark:         #042628 (Primary text)
Light Green:       #EBF2E6 (Subtle backgrounds)
Text Secondary:    Gray (Subtle text)
Border:            Gray with opacity (Secondary elements)
Shadow:            Black with opacity (Floating elements)
```

### **Typography System**
- **Large Title**: 34pt, Bold (Main headlines)
- **Title 1**: 28pt, Bold (Section headers)
- **Title 2**: 22pt, Semibold (Subsection headers)
- **Title 3**: 20pt, Semibold (Card titles)
- **Headline**: 17pt, Semibold (Button text)
- **Body Text**: 17pt, Regular (Main content)
- **Callout**: 16pt, Regular (Supporting text)
- **Subheadline**: 15pt, Regular (Secondary content)
- **Footnote**: 13pt, Regular (Small text)
- **Caption**: 12pt, Regular (Tiny text)
- **Button Text**: 18pt, Semibold (Action buttons)

### **Spacing System**
```swift
xs: 4pt    # Minimal spacing
sm: 8pt    # Small spacing
md: 12pt   # Medium spacing
lg: 16pt   # Large spacing
xl: 24pt   # Extra large spacing
xxl: 32pt  # Section spacing
xxxl: 48pt # Screen edge padding
```

## 📱 Screen Implementations

### **1. Onboarding Flow (`OnboardingView.swift`)**
- **Purpose**: Introduce users to the app's core features
- **Design**: 3 screens with large image placeholders, bold headlines, supporting text
- **Features**:
  - Smooth swipe gestures between screens
  - Progress indicator showing current page
  - Skip button (top right, subtle gray)
  - Navigation buttons (Back/Next/Get Started)
  - Half-width buttons with green styling and animations
  - Transitions to authentication flow

### **2. Authentication System**
#### **Main Container (`AuthenticationView.swift`)**
- **Purpose**: Handles login/signup mode switching
- **Design**: Two-tone background (colored top, white bottom)
- **Features**:
  - App logo and branding in colored section
  - Mode switching between login and signup
  - Navigation to main app after successful auth
  - Forgot password functionality

#### **Login Form (`LoginFormView`)**
- **Purpose**: User authentication
- **Design**: Clean form in white section
- **Features**:
  - Email and password fields
  - Primary "Sign In" button
  - Apple Sign In integration
  - Forgot password link
  - Mode switch to signup

#### **Signup Form (`SignupFormView`)**
- **Purpose**: New user registration
- **Design**: Matching login form layout
- **Features**:
  - Name, email, password, confirm password fields
  - Primary "Sign Up" button
  - Apple Sign In integration
  - Mode switch to login

#### **Forgot Password (`ForgotPasswordView.swift`)**
- **Purpose**: Password reset functionality
- **Design**: Simple form with email input
- **Features**:
  - Email input field
  - Send reset email button
  - Cancel navigation (plain text, no styling)

### **3. Navigation System (`MainTabView.swift`)**
- **Purpose**: Main app navigation with 5 tabs
- **Design**: Bottom-positioned tab bar with floating center button
- **Features**:
  - **Home**: Dashboard/analytics (tab 0)
  - **Scan**: Food scanning (tab 1)
  - **AI Chat**: Floating center button (tab 2)
  - **Recipes**: Recipe management (tab 3)
  - **Profile**: User settings (tab 4)
- **Styling**: Normal bottom navigation (no floating effects)
- **Center Button**: Circular, elevated, primary green background

### **4. Dashboard/Homepage (`HomeView.swift`)**
- **Purpose**: Analytics and meal history overview
- **Design**: Clean, premium analytics page
- **Features**:
  - **Date Selector**: Choose different days for nutrition overview
  - **Today's Overview**: Quick stats with colored stat cards
    - Calories (orange background, white text)
    - Protein (blue background, white text)
    - Carbs (green background, white text)
    - Fat (purple background, white text)
  - **Recent Meals**: List of past scanned meals
    - Meal cards with subtle gray backgrounds
    - Nutrition badges (calories, protein, carbs, fat)
    - No images/icons, text-only design
  - **Meal Detail View**: Expandable nutrition information

### **5. Profile Page (`ProfileView.swift`)**
- **Purpose**: User settings and account management
- **Design**: Clean profile layout with action buttons
- **Features**:
  - User name display at top
  - Action buttons:
    - **Upgrade Plan**: Primary button for subscription
    - **Log Out**: Destructive button with confirmation
    - **Privacy Policy**: Secondary button (link only)
    - **Terms of Service**: Secondary button (link only)
  - Logout confirmation alert

### **6. Placeholder Screens**
- **Scan View**: Empty placeholder for food scanning
- **Recipes View**: Empty placeholder for recipe management

## 🧩 Reusable Components

### **CustomTextField**
- **Purpose**: Consistent text input styling
- **Features**: Rounded corners, proper padding, floating labels
- **Usage**: All form inputs throughout the app

### **PrimaryButton**
- **Purpose**: Main action buttons
- **Features**: Green background, white text, proper sizing
- **Usage**: Sign in/up, navigation actions

### **SecondaryButton**
- **Purpose**: Secondary actions
- **Features**: Border styling, gray text
- **Usage**: Cancel actions, less important buttons

### **TwoToneBackground**
- **Purpose**: Authentication screen backgrounds
- **Features**: Colored top section, white bottom section
- **Usage**: Login, signup, forgot password screens

### **ProfileButton**
- **Purpose**: Profile page action buttons
- **Features**: Icon, title, action handling, destructive styling
- **Usage**: Profile page actions

### **StatCard**
- **Purpose**: Dashboard statistics display
- **Features**: Colored backgrounds, white text, nutrition data
- **Usage**: Today's overview section

### **MealCard**
- **Purpose**: Recent meals display
- **Features**: Subtle gray background, nutrition badges
- **Usage**: Recent meals list

### **NutritionBadge**
- **Purpose**: Nutrition information display
- **Features**: Small, colored badges with nutrition values
- **Usage**: Meal cards, nutrition details

## 🎯 Design Principles

### **Premium Feel**
- Generous white space (40-50pt padding from screen edges)
- Perfect alignment and spacing
- Smooth spring animations
- Strategic use of primary green color
- Clean, minimal design language

### **User Experience**
- Intuitive navigation flow
- Consistent interaction patterns
- Smooth transitions between screens
- Clear visual hierarchy
- Accessible button sizes (50-56pt minimum)

### **Technical Excellence**
- MVVM-like folder structure
- Centralized design system
- Reusable components
- Consistent naming conventions
- Clean, maintainable code

## 🚀 Getting Started

### **Requirements**
- iOS 16.0+
- Xcode 15.0+
- SwiftUI

### **Installation**
1. Clone the repository
2. Open `Food App New.xcodeproj` in Xcode
3. Build and run on iOS Simulator or device

### **Project Setup**
- The app starts with the onboarding flow
- No backend integration required (mock data only)
- All screens are fully functional with visual-only implementation

## 📋 Development Notes

### **Current State**
- All core screens implemented and functional
- Premium design system established
- Navigation flow complete
- Authentication system ready
- Dashboard with analytics implemented
- Profile management complete

### **Next Steps**
- Implement AI Chat functionality (center button)
- Add food scanning features
- Build recipe management system
- Integrate backend services
- Add data persistence
- Implement real authentication

### **Code Quality**
- Clean, well-documented SwiftUI code
- Consistent design system usage
- Proper separation of concerns
- Reusable component architecture
- No hardcoded values (all centralized)

## 🎨 Visual Design Highlights

### **Onboarding**
- Large, impactful headlines
- Smooth page transitions
- Progress indicators
- Strategic button placement

### **Authentication**
- Two-tone background design
- Centered branding in colored section
- Clean form layouts in white section
- Consistent button styling

### **Navigation**
- Bottom-positioned tab bar
- Floating center button for AI Chat
- Smooth tab transitions
- Clear visual hierarchy

### **Dashboard**
- Analytics-focused design
- Colored stat cards
- Clean meal history
- Date selection functionality

### **Profile**
- Simple, clean layout
- Clear action buttons
- Proper destructive action handling
- Consistent styling

This documentation provides a comprehensive overview of the current frontend implementation, design system, and project structure for future development reference.

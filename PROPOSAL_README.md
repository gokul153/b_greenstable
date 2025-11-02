# 💕 Romantic Proposal Website

A beautiful, interactive Flutter application designed to propose to your crush with style and romance!

## ✨ Features

### 1. **Proposal Page** (`lib/page/proposal_page.dart`)
- **Animated Gradient Background**: Beautiful pink and red gradient that sets the romantic mood
- **Floating Hearts Animation**: Continuously animated hearts floating in the background
- **Smooth Fade-in Effects**: All elements fade in gracefully when the page loads
- **Interactive Buttons**:
  - **"Yes! 💖" Button**: Leads to the celebration page
  - **"No" Button**: Playfully moves away when clicked! It changes text through 6 different messages:
    - "No"
    - "Are you sure?"
    - "Really?"
    - "Think again!"
    - "Please? 🥺"
    - "Last chance!"
  - After 6 attempts, the "No" button disappears with a message: "I knew you'd say yes! 😊"

### 2. **Celebration Page** (`lib/page/celebration_page.dart`)
- **Confetti Animation**: Colorful confetti continuously falling from the top
- **Heartbeat Animation**: A large heart that pulses with life
- **Beautiful Message**: A heartfelt message expressing your feelings
- **Emoji Hearts**: Animated emoji hearts that scale in
- **Romantic Promise**: A special message about your commitment

## 🎨 Design Features

- **Color Scheme**: Romantic pinks, reds, and soft gradients
- **Animations**:
  - Fade-in transitions
  - Scale animations
  - Heartbeat effects
  - Floating particles
  - Confetti celebration
- **Typography**: Clean, bold fonts with shadows for depth
- **Responsive Layout**: Works on all screen sizes

## 🚀 How to Run

1. Make sure you have Flutter installed on your system
2. Navigate to the project directory:
   ```bash
   cd /vercel/sandbox
   ```

3. Get dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   # For web
   flutter run -d chrome
   
   # For Android
   flutter run -d android
   
   # For iOS
   flutter run -d ios
   ```

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ Windows
- ✅ macOS
- ✅ Linux

## 🎯 User Experience Flow

1. **App Opens** → User sees the Proposal Page with floating hearts
2. **User Reads Message** → "Will You Be My Girlfriend?" with a sweet message
3. **User Clicks "Yes"** → Immediately goes to Celebration Page with confetti
4. **User Clicks "No"** → Button moves away playfully, encouraging them to say yes
5. **After 6 "No" Clicks** → Button disappears, assuming they'll say yes anyway! 😊

## 💝 Customization

You can easily customize the messages in the code:

### Proposal Message
Edit in `lib/page/proposal_page.dart`:
```dart
Text(
  'Will You Be\nMy Girlfriend?',  // Change this
  // ...
),
```

### Sweet Message
```dart
Text(
  'You make my heart skip a beat\nevery time I see you 💕',  // Change this
  // ...
),
```

### Celebration Message
Edit in `lib/page/celebration_page.dart`:
```dart
Text(
  'You\'ve Made Me\nThe Happiest Person! 💕',  // Change this
  // ...
),
```

### Promise Message
```dart
Text(
  'I promise to make you smile every day,\nto support you in everything you do,\nand to love you with all my heart.',  // Change this
  // ...
),
```

## 🎨 Color Customization

### Proposal Page Gradient
```dart
colors: [
  Color(0xFFFF6B9D),  // Pink
  Color(0xFFC06C84),  // Mauve
  Color(0xFFF67280),  // Coral
  Color(0xFFFF8E9E),  // Light pink
],
```

### Celebration Page Gradient
```dart
colors: [
  Color(0xFFFF9A9E),  // Light pink
  Color(0xFFFAD0C4),  // Peach
  Color(0xFFFAD0C4),  // Peach
  Color(0xFFFFD1FF),  // Lavender
],
```

## 📝 Technical Details

- **State Management**: Uses Flutter's built-in StatefulWidget with AnimationControllers
- **Animations**: Multiple AnimationControllers for smooth, independent animations
- **Custom Painting**: CustomPainter for hearts and confetti effects
- **Navigation**: Simple Navigator.push for page transitions

## 💡 Tips for the Big Moment

1. **Test First**: Run the app before the actual proposal to make sure everything works
2. **Charge Your Device**: Make sure your phone/tablet is fully charged
3. **Good Lighting**: Choose a well-lit environment so they can see the beautiful colors
4. **Be Ready**: Have the app already open on the proposal page
5. **Smile**: Your happiness will make the moment even more special! 😊

## 🎉 Good Luck!

May your proposal be as beautiful as this app, and may the answer always be "Yes!" 💕

---

**Created with ❤️ using Flutter**

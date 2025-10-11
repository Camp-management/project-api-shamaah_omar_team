# **Smart Notes** 📁 

A clean, lightweight Flutter app for managing **lists of bookmarks inside folders**. Add, edit, delete, search, and quickly open bookmarks. Enjoy niceties like **pull-to-refresh**, **animated checkmarks** (with persistent state), **swipe actions**, and **instant login after signup**.

---

## ✨ Features

- **Folders → Bookmarks hierarchy**
- **Auth**
  - Sign up → auto login (fetch token by logging in after signup)
  - Token persisted with `GetStorage`
  - Logout clears token and returns to Login
- **Bookmark UX**
  - Open URLs in external browser
  - Swipe (Slidable) to **Edit** / **Delete**
  - **Pull-to-refresh** on lists
  - **Search** ability to search for folders and for bookmarks
  - **Animated checkmark** per bookmark; state is saved per folder via `GetStorage`
- **Polished UI**
  - clear widgets that are easy to understand
  - Subtle and smooth animations 

---

## 📸 Screens 

- **Login** / **Signup**
- **Folders list**
   - Create / Update / Delete
- **Bookmarks list (for a folder)**
  - Create / Update / Delete
  - Open URL
  - Toggle checkmark 

---
## 📸 Demo Video

https://github.com/user-attachments/assets/4669d3e8-6a01-47bb-b894-6539464475fd





---

## 🧱 Tech Stack

- **Flutter** (Material)
- **HTTP** via `package:http/http.dart`
- **Persistence**: `get_storage` (token + bookmark checkmarks)
- **Models/Codegen**: `dart_mappable`
- **UI helpers**:
  - `flutter_slidable` (swipe actions)
  - `url_launcher` (open links)

---


## 🔐 Authentication Flow

- **Signup:** `POST /sign_up/` with email + password  
  _Server typically **does not** return token on signup._
- **Auto login after signup:** Immediately call `loginAccount` with the same credentials to fetch `access_token`.
- **Persist token:** Save token to `GetStorage` (key: `token`).
- **App entry:** `LoginScreen` checks storage; if token exists, navigates directly to folders.
- **Logout:** Remove `token` and navigate back to Login.

**Snippet (signup → login → go to app):**
```dart
final data = AuthInput(email: email, password: password);

// 1) sign up (no token expected)
await api.authMethod.signupAccount(authData: data);

// 2) then login to fetch token
final loginRes = await api.authMethod.loginAccount(authData: data);
await GetStorage().write('token', loginRes.access_token);

// 3) go to app (Folders)
Navigator.pushReplacement(context,
  MaterialPageRoute(builder: (_) => const FolderScreen()));
```

---

## 🗂️ Folders

- Screen: `FolderScreen`
- Loads via `api.folderMethod.getAllFolders()`
- Pull-to-refresh (`RefreshIndicator`)
- Minimal search by folder name
- Tap folder → navigate to **Bookmarks** of that folder

---

## 🔖 Bookmarks

- Screen: `BookmarksScreen(folderId: ...)`
- Loads via `api.bookmarksMethod.getBookmarksByFolder(id: folderId)`
- Pull-to-refresh (`RefreshIndicator`)
- **Search by URL** (basic)
- Tap → opens the URL (`url_launcher`)
- **Checkmark toggle** per bookmark:
  - Persisted **per folder** with `GetStorage`
  - Storage key: `checked_bookmarks_<folderId>`
- **Slidable actions**
  - Edit → opens dialog → refreshes
  - Delete → API delete → refreshes



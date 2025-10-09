[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/wxIJC35s)
# واجب الويكند: تطبيق إدارة الإشارات المرجعية بـ Flutter + Dio

## 📋 نظرة عامة على المشروع

ستقوم ببناء تطبيق **"My Bookmarks"** باستخدام Flutter و Dio للتعامل مع API إدارة الإشارات المرجعية.

**API docs:** https://api-week.onrender.com/docs

## 🎯 أهداف التعلم

- تعلم استخدام **Dio or Http** للتعامل مع REST APIs
- إدارة **Authentication** في Flutter
- تطبيق **State Management** (Basic state mangment)
- تطبيق **Models** (dart_mappable)
- بناء **UI/UX** تصميم مقبول للمشروع
- معالجة **الأخطاء** والـ Loading States
- تطبيق **CRUD Operations**

## 📱 المتطلبات الوظيفية

### المرحلة الأولى: Authentication 
- [require] شاشة تسجيل الدخول (Sign In)
- [require] شاشة إنشاء حساب (Sign Up)
- [require] Auto-login عند فتح التطبيق
- [require] تسجيل الخروج (Sign Out)

### المرحلة الثانية: إدارة المجلدات 
- [require] عرض قائمة المجلدات
- [require] إنشاء مجلد جديد
- [require] تحديث مجلد موجود
- [require] حذف مجلد
- [require] عرض محتويات المجلد

### المرحلة الثالثة: إدارة الإشارات المرجعية 
- [require] عرض قائمة الإشارات المرجعية
- [require] إضافة إشارة مرجعية جديدة
- [require] تحديث إشارة مرجعية
- [require] حذف إشارة مرجعية
- [require] ربط الإشارة بمجلد
- [Bouns] تمييز الإشارات المقروءة/غير المقروءة

### المرحلة الرابعة: تحسينات 
- [Bouns] تصميم جذاب ومتجاوب
- [require] Loading indicators
- [require] معالجة الأخطاء مع رسائل واضحة
- [Bouns] Pull-to-refresh
- [Bouns] Search functionality
- [Bouns] Dark/Light theme

## 🛠️ المتطلبات التقنية

### Dependencies المطلوبة:
```yaml
  - [option] fluttertoast
  - [option] url_launcher
  - [option] flutter_spinkit
  - [require] dio or http
  - [require] dart_mappable
```

### توضيح لهيكل المشروع: Options
```
lib/
├── main.dart
├── models/
│   ├── user.dart
│   ├── folder.dart
│   └── bookmark.dart
├── network/
│   ├── constant_api.dart
│   ├── auth_api.dart
│   └── folder_api.dart
|   └── bookmark.dart
|   └── network.dart
|
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── signup_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   ├── folders/
│   │   ├── folders_screen.dart
│   │   └── folder_detail_screen.dart
│   └── bookmarks/
│       ├── bookmarks_screen.dart
│       └── add_bookmark_screen.dart
├── widgets/
│   ├── custom_button.dart
│   ├── custom_text_field.dart
│   ├── folder_card.dart
│   └── bookmark_card.dart
└── utils/
    ├── constants.dart
    └── helpers.dart
```



## 📋 مهام الواجب

### المرحلة الأولى
1. **إعداد المشروع**
   - إنشاء مشروع Flutter جديد
   - إضافة Dependencies المطلوبة
   - إنشاء هيكل المجلدات

2. **تنفيذ Authentication**
   - إنشاء ApiService
   - تنفيذ AuthProvider
   - بناء شاشات Login و SignUp
   - اختبار تسجيل الدخول والخروج

### المرحلة الثانية 
3. **تنفيذ إدارة المجلدات**
   - إنشاء FolderProvider
   - بناء شاشة المجلدات
   - تنفيذ CRUD operations للمجلدات
   - إضافة UI للإضافة والتعديل والحذف

### المرحلة الثالثة 
4. **تنفيذ إدارة الإشارات المرجعية**
   - إنشاء BookmarkProvider
   - بناء شاشات الإشارات المرجعية
   - تنفيذ CRUD operations للإشارات
   - ربط الإشارات بالمجلدات

5. **التحسينات والتشطيبات**
   - تحسين UI/UX
   - إضافة Loading states
   - معالجة الأخطاء
   - اختبار شامل للتطبيق

## 🏆 معايير التقييم

### الوظائف الأساسية 
- Authentication يعمل بشكل صحيح 
- إدارة المجلدات كاملة 
- إدارة الإشارات المرجعية كاملة 

### جودة الكود 
- تنظيم الكود وهيكل المشروع 
- استخدام State Management بشكل صحيح 
- معالجة الأخطاء 
-  استخدام Models بشكل الصحيح  

### UI/UX 
- تصميم مقبول ومتجاوب 
- تجربة مستخدم سلسة 

## 📚 مصادر مساعدة

### Documentation
- [Flutter Documentation](https://docs.flutter.dev/)
- [Dio Package](https://pub.dev/packages/dio)
- [dart_mappable](https://pub.dev/packages/dart_mappable)


### API Reference
- **Base URL:** https://api-week.onrender.com
- **Documentation:** https://api-week.onrender.com/docs

### نصائح مهمة
1. **اختبر API أولاً** باستخدام Postman أو curl
2. **ابدأ بالوظائف الأساسية** ثم أضف التحسينات
3. **استخدم try-catch** لمعالجة الأخطاء
4. **احفظ Token** باستخدام shared_preferences or get_storage
5. **اختبر على أجهزة مختلفة** للتأكد من التجاوب

## 📅 جدول التسليم


- **الاحد:** تسليم المشروع النهائي
- **الوقت:** الساعة 10:00 AM
- 
## 🎯 التحدي الإضافي (نقاط إضافية)

- إضافة **Search functionality**
- تنفيذ **Dark/Light theme**
- إضافة **Offline caching**
- تنفيذ **Pull-to-refresh**
- إضافة **URL validation** و **URL launcher**

---

**حظ موفق! 🚀**






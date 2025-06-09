// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: SafeArea(
//         child: Container(
//           width: double.infinity,
//           margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
//           padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),

//           // padding: EdgeInsets.all(3.w),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(3.w),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 blurRadius: 6,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Title
//                 Text(
//                   "Admin Details",
//                   style: TextStyle(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 1.h),

//                 // Yellow Subheading
//                 Text(
//                   "User Info:",
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w600,
//                     color: const Color(0xFFFFB800),
//                   ),
//                 ),
//                 Divider(),
//                 SizedBox(height: 2.h),

//                 // Row: Info + Image
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Info Column
//                     Expanded(
//                       flex: 6,
//                       child: Column(
//                         children: [
//                           _infoRow(
//                             Icons.person,
//                             "Name:",
//                             "John Doe",
//                             bold: true,
//                           ),
//                           _infoRow(Icons.badge, "ID#", "458799"),
//                           _infoRow(Icons.phone, "Number#", "(0) 955 55 765"),
//                           _infoRow(
//                             Icons.email_outlined,
//                             "Email ID:",
//                             "johndoe@gmail.com",
//                             bold: true,
//                           ),
//                           _infoRow(Icons.lock, "Password", "●●●●●●●"),
//                         ],
//                       ),
//                     ),
//                     SizedBox(width: 5.w),

//                     // Profile Image
//                     Expanded(
//                       flex: 4,
//                       child: Transform.translate(
//                         offset: Offset(0, -5.h),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(
//                             3.w,
//                           ), // responsive corner
//                           child: AspectRatio(
//                             aspectRatio: 1, // optional: square image
//                             child: Image.asset(
//                               "assets/images/user.jpg",
//                               fit: BoxFit
//                                   .cover, // important for borderRadius to apply
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _infoRow(
//     IconData icon,
//     String label,
//     String value, {
//     bool bold = false,
//   }) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 0.9.h),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.pink, size: 14.sp),
//           SizedBox(width: 1.w),
//           Text(
//             label,
//             style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700),
//           ),
//           SizedBox(width: 1.w),
//           Expanded(
//             child: Text(
//               value,
//               style: TextStyle(
//                 fontSize: 12.sp,
//                 fontWeight: bold ? FontWeight.bold : FontWeight.w500,
//                 color: Colors.black,
//               ),
//               // overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Icon(Icons.edit, size: 14.sp, color: Colors.grey.shade400),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String name = "John Doe";
  final String id = "458799"; // fixed ID
  String phone = "(0) 955 55 765";
  String email = "johndoe@gmail.com";
  String password = "password123";

  void _editField({
    required String label,
    required String value,
    required ValueChanged<String> onSave,
    bool isPassword = false,
  }) {
    final controller = TextEditingController(text: value);
    bool showPassword = false;

    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setModalState) {
          return AlertDialog(
            title: Text("Edit $label"),
            content: TextField(
              controller: controller,
              obscureText: isPassword && !showPassword,
              decoration: InputDecoration(
                hintText: "Enter $label",
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setModalState(() => showPassword = !showPassword);
                        },
                      )
                    : null,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  onSave(controller.text);
                  Navigator.pop(context);
                },
                child: const Text("Save"),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 3.h),
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 3.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3.w),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Admin Details",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 1.h),
              Text(
                "User Info:",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFFB800),
                ),
              ),
              Divider(),
              SizedBox(height: 2.h),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Info Section
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        _infoRow(
                          icon: Icons.person,
                          label: "Name",
                          value: name,
                          onEdit: (val) => setState(() => name = val),
                          bold: true,
                        ),
                        _infoRow(
                          icon: Icons.badge,
                          label: "ID#",
                          value: id,
                          editable: false,
                        ),
                        _infoRow(
                          icon: Icons.phone,
                          label: "Number#",
                          value: phone,
                          onEdit: (val) => setState(() => phone = val),
                        ),
                        _infoRow(
                          icon: Icons.email_outlined,
                          label: "Email ID",
                          value: email,
                          onEdit: (val) => setState(() => email = val),
                          bold: true,
                        ),
                        _infoRow(
                          icon: Icons.lock,
                          label: "Password",
                          value: "●●●●●●●●",
                          isPassword: true,
                          onEdit: (val) => setState(() => password = val),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5.w),

                  /// Image Section
                  Expanded(
                    flex: 4,
                    child: Transform.translate(
                      offset: Offset(0, -5.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3.w),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            "assets/images/user.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow({
    required IconData icon,
    required String label,
    required String value,
    bool bold = false,
    bool editable = true,
    bool isPassword = false,
    ValueChanged<String>? onEdit,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.9.h),
      child: Row(
        children: [
          Icon(icon, color: Colors.pink, size: 14.sp),
          SizedBox(width: 1.w),
          Text(
            "$label:",
            style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700),
          ),
          SizedBox(width: 1.w),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: bold ? FontWeight.bold : FontWeight.w500,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (editable)
            GestureDetector(
              onTap: () {
                if (onEdit != null) {
                  _editField(
                    label: label,
                    value: isPassword ? password : value,
                    onSave: onEdit,
                    isPassword: isPassword,
                  );
                }
              },
              child: Icon(Icons.edit, size: 14.sp, color: Colors.grey.shade400),
            ),
        ],
      ),
    );
  }
}

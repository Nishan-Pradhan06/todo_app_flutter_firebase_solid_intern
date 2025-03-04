import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../todo/presentation/screens/home_screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);

    // // Check if user is already authenticated
    // if (authProvider.user != null) {
    //   // Use a microtask to avoid build phase navigation issues
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => HomeScreen()),
    //     );
    //   });
    // }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade800, Colors.deepPurple.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 20),
              Text(
                "Welcome to Todo App",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),

              // Show error message if exists
              // if (authProvider.errorMessage != null)
              //   Padding(
              //     padding: const EdgeInsets.only(bottom: 20),
              //     child: Text(
              //       authProvider.errorMessage!,
              //       style: GoogleFonts.poppins(
              //         color: Colors.red.shade300,
              //         fontSize: 14,
              //       ),
              //     ),
              //   ),

              // Sign-in button with loading state
              ElevatedButton.icon(
                icon: Image.asset(
                  'assets/logo/google.png',
                  height: 24,
                ),
                label: Text(
                  "Sign in with Google",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              // ElevatedButton.icon(
              //   icon: authProvider.isLoading
              //       ? const SizedBox(
              //           width: 24,
              //           height: 24,
              //           child: CircularProgressIndicator(
              //             color: Colors.white,
              //             strokeWidth: 2,
              //           ),
              //         )
              //       : Image.asset(
              //           'assets/logo/google.png',
              //           height: 24,
              //         ),
              //   label: Text(
              //     authProvider.isLoading
              //         ? "Signing in..."
              //         : "Sign in with Google",
              //     style: GoogleFonts.poppins(
              //       fontSize: 16,
              //       color: Colors.white,
              //     ),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              //     backgroundColor: Colors.deepPurpleAccent,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     elevation: 5,
              //   ),
              //   onPressed: authProvider.isLoading
              //       ? null
              //       : () async {
              //           final success = await authProvider.signInWithGoogle();
              //           if (success && context.mounted) {
              //             Navigator.of(context).pushReplacement(
              //               MaterialPageRoute(
              //                   builder: (context) => HomeScreen()),
              //             );
              //           }
              //         },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

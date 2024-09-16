import 'package:flutter/material.dart'; 

void main() {
  runApp(
      MyApp()); 
}


class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Arial',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ), // Tema aplikasi
      home: HalamanLogin(),
    );
  }
}

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<HalamanLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == '124220021' && password == '124220021') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const HalamanDashboard()), // Pindah ke halaman dashboard
      );
    } else {
      // Jika login gagal
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login gagal.'),
        backgroundColor: Colors.redAccent,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 249, 249, 226),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome Back",
                style: TextStyle(
                    fontSize: 27,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 45),
            Image.asset('images/gerak.gif', height: 100),
            const SizedBox(height: 20),
            const Text("Please Log in!",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.black26)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black)),
                labelText: 'Username',
                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.key),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.black26)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black)),
                labelText: 'Password',
                labelStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              style: const TextStyle(color: Colors.black),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 0, 115, 209), // Mengubah warna tombol menjadi biru
                  foregroundColor: Colors.white,
                ),
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}

class HalamanDashboard extends StatelessWidget {
  const HalamanDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.person_2),
        title: const Text('Home',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HalamanLogin()),
                );
              },
              icon: const Icon(Icons.logout, color: Colors.black)),
        ],
        backgroundColor: const Color.fromARGB(255, 92, 206, 143),
      ),
      body: Container(
        color: const Color.fromARGB(255, 249, 249, 226),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              ClipOval(
                child: Image.asset(
                  'images/luthfi.jpeg',
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              const Text('Login berhasil,',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              const Text('Selamat datang 124220021',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

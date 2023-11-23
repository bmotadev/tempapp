<h1 align="center">🏖️ TempApp - Veja o tempo antes de sair!</h1>
<p align="center">TempApp é um aplicativo para verificar o tempo de acordo com a sua localização. Utiliza dados da API do OpenWeather. Feito com Flutter. O Objetivo deste aplicativo foi aprender mais sobre Dart & Flutter. E como consumir APIs e manter a chave da api restrita.</p>

---


### 📱 Telas

<p align="center"><img src="https://github.com/bmotadev/tempapp/blob/main/assets/images/tempapp1.jpg" width="200"></p>

---

### ➡️ Funcionalidades

- Exibe o clima de acordo com sua localização
- É exibido animações conforme o clima muda

---

### 🧰 Decisões Ténicas

- Meu principal objetivo era aprender a consumir API no Flutter e deixar a chave da api restrita. Então busquei como fazer isso. Existia a alternativa por .env, porém na hora do build a mesma ia junto para o App. Então utilizei o --dart-define-from-file, que é um recurso relativamente novo no dart/flutter. Permitindo que o aplicativo execute usando a chave da API, sem comprometer a segurança. Tendo que configurar no launch.json. E definir qual arquivo será utilizado, no meu caso utilizei um json.

Aqui na documentação do Dart pode verificar o que foi feito: https://dartcode.org/docs/using-dart-define-in-flutter/

---

### 👨‍💻 Author

<a href="https://www.linkedin.com/in/bmotadev/"><img src="https://avatars.githubusercontent.com/u/123843027?v=4" width="96"><p>Bruno Mota</p></a>

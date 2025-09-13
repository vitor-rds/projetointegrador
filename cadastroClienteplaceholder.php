<?php
// Tratamento de upload do currículo
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_FILES['curriculo']) && $_FILES['curriculo']['error'] === UPLOAD_ERR_OK) {
        $nomeArquivo = $_FILES['curriculo']['name'];
        echo "<p><strong>Arquivo enviado:</strong> " . htmlspecialchars($nomeArquivo) . "</p>";
    } else {
        echo "<p><strong>Nenhum arquivo selecionado ou erro no envio.</strong></p>";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro - Cliente e Profissional</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f6f9;
      margin: 0;
      padding: 0;
    }
    header {
      background: #2c3e50;
      color: white;
      padding: 15px;
      text-align: center;
    }
    main {
      max-width: 900px;
      margin: 20px auto;
      padding: 20px;
    }
    h2 {
      color: #2c3e50;
      margin-top: 30px;
    }
    .section {
      background: #a3c2a2;
      padding: 20px;
      border-radius: 6px;
      margin-bottom: 20px;
    }
    .form-row {
      display: flex;
      gap: 15px;
      margin-bottom: 15px;
      flex-wrap: wrap;
    }
    label {
      display: flex;
      flex-direction: column;
      font-weight: bold;
      flex: 1;
      min-width: 200px;
    }
    input, select {
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
      margin-top: 5px;
    }
    .foto {
      display: flex;
      align-items: center;
      gap: 15px;
      margin-bottom: 15px;
    }
    .foto .circle {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      background: white;
      display: flex;
      justify-content: center;
      align-items: center;
      border: 2px solid #ccc;
      font-size: 14px;
      color: #555;
    }
    .links-foto a {
      font-size: 12px;
      margin-right: 8px;
      text-decoration: none;
      color: #0066cc;
    }
    .btn {
      padding: 10px 20px;
      background: #2c3e50;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-size: 16px;
      margin-top: 10px;
    }
    .btn:hover {
      background: #1a242f;
    }
    /* Login extra */
    .login-extra {
      text-align: center;
      margin-top: 20px;
      padding: 20px;
      background: #f8f8f8;
      border: 1px solid #ddd;
      border-radius: 6px;
    }
    .login-extra h3 {
      margin-bottom: 15px;
      color: #333;
    }
    .google-btn {
      background: white;
      border: 1px solid #ccc;
      padding: 10px;
      width: 100%;
      font-size: 14px;
      cursor: pointer;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
      border-radius: 4px;
    }
    .separator {
      margin: 15px 0;
      font-weight: bold;
      color: #555;
    }
    .login-extra input {
      width: 100%;
      margin-bottom: 10px;
    }
    .cadastre-btn {
      padding: 10px;
      width: 100%;
      background: #2c3e50;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 16px;
      cursor: pointer;
    }
    .cadastre-btn:hover {
      background: #1a242f;
    }
    .terms {
      font-size: 12px;
      color: #666;
      margin-top: 10px;
    }
    .terms a {
      color: #0066cc;
      text-decoration: none;
    }
  </style>
</head>
<body>
  <header>
    <h1>Cadastro</h1>
  </header>

  <main>
    <!-- Cadastro do Cliente -->
    <form method="post" enctype="multipart/form-data">
      <h2>Informações Pessoais</h2>
      <div class="section">
        <div class="foto">
          <div class="circle">Foto</div>
          <div class="links-foto">
            <a href="#">Adicionar foto</a> |
            <a href="#">Remover</a>
          </div>
        </div>
        <div class="form-row">
          <label>Nome Completo
            <input type="text" name="nome" placeholder="João da Silva">
          </label>
          <label>Data de Nascimento
            <input type="date" name="data_nascimento" placeholder="01/01/1990">
          </label>
        </div>
        <div class="form-row">
          <label>CPF
            <input type="text" name="cpf" placeholder="123.456.789-00">
          </label>
          <label>Sexo
            <select name="sexo">
              <option value="">Selecione</option>
              <option>Masculino</option>
              <option>Feminino</option>
              <option>Outro</option>
            </select>
          </label>
        </div>
      </div>

      <h2>Endereço</h2>
      <div class="section">
        <div class="form-row">
          <label>Logradouro
            <input type="text" name="logradouro" placeholder="Rua das Flores">
          </label>
          <label>Número
            <input type="text" name="numero" placeholder="123">
          </label>
        </div>
        <div class="form-row">
          <label>Bairro
            <input type="text" name="bairro" placeholder="Centro">
          </label>
          <label>Cidade
            <input type="text" name="cidade" placeholder="São Paulo">
          </label>
          <label>UF
            <select name="uf">
              <option value="">Selecione</option>
              <option>SP</option>
              <option>RJ</option>
              <option>MG</option>
              <option>RS</option>
            </select>
          </label>
        </div>
      </div>

      <h2>Contato</h2>
      <div class="section">
        <div class="form-row">
          <label>Email
            <input type="email" name="email" placeholder="joao@email.com">
          </label>
          <label>Telefone
            <input type="text" name="telefone" placeholder="(11) 91234-5678">
          </label>
        </div>
      </div>

      <!-- Currículo do profissional -->
      <h2>Profissional</h2>
      <div class="section">
        <label>Upload do currículo:
          <input type="file" name="curriculo" accept=".pdf,.doc,.docx">
        </label>
      </div>

      <button type="submit" class="btn">Salvar Cadastro</button>
    </form>

    <!-- Login extra (profissional) -->
    <div class="login-extra">
      <h3>BEM-VINDO DE VOLTA!</h3>
      <button class="google-btn">
        <img src="https://www.svgrepo.com/show/355037/google.svg" width="18"> Fazer login com o Google
      </button>
      <div class="separator">OU</div>
      <input type="text" placeholder="Digite seu e-mail ou nome de usuário">
      <input type="password" placeholder="Digite sua senha">
      <button class="cadastre-btn">CADASTRE-SE</button>
      <p class="terms">
        Ao clicar em Cadastre-se você concorda com nossos 
        <a href="#">Termos</a>, 
        <a href="#">Política de Privacidade</a> e 
        <a href="#">Política de Cookies</a>. 
        Você poderá receber notificações por SMS e cancelar isso quando quiser.
      </p>
    </div>
  </main>
</body>
</html>

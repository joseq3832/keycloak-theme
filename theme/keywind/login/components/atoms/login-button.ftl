<#macro kw>
  <button type="submit"
    class="bg-primary-600 text-white focus:ring-primary-600 hover:bg-primary-700 px-4 py-2 text-sm flex justify-center relative rounded-lg w-full focus:outline-none focus:ring-2 focus:ring-offset-2"
    id="loginButton"
  >
    Iniciar Sesión
  </button>

  <script>
    // Función para habilitar o deshabilitar el botón según el contenido de los campos de entrada
    function updateButtonState() {
      const usernameInput = document.querySelector('input[name="username"]');
      const passwordInput = document.querySelector('input[name="password"]');
      const loginButton = document.getElementById('loginButton');

      // Verificar si los campos de entrada están vacíos
      const isDisabled = usernameInput.value.trim() === '' || passwordInput.value.trim() === '';

      // Actualizar el estado del botón
      loginButton.disabled = isDisabled;

      // Cambiar la opacidad del botón según su estado
      loginButton.style.opacity = isDisabled ? '0.6' : '1';
    }

    // Escuchar eventos de cambio en los campos de entrada
    const usernameInput = document.querySelector('input[name="username"]');
    const passwordInput = document.querySelector('input[name="password"]');
    usernameInput.addEventListener('input', updateButtonState);
    passwordInput.addEventListener('input', updateButtonState);

    // Llamar a la función inicialmente para configurar el estado del botón al cargar la página
    updateButtonState();
  </script>
</#macro>

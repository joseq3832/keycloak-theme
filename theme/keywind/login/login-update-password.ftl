<#import "./document.ftl" as document>
<#import "components/atoms/button.ftl" as button>
<#import "components/atoms/button-group.ftl" as buttonGroup>
<#import "components/atoms/form.ftl" as form>
<#import "components/atoms/input.ftl" as input>

<html>
    <head>
      <@document.kw script=script />
    </head>
    <body class="w-full h-full bg-white py-10 px-2 md:px-4 lg:px-6 flex flex-col items-center">
      <div class="px-6 mb-4 pb-4 w-full border-b border-gray-200">
        <h1 class="text-xl font-semibold text-[#E0252D]">
          Registrar contraseña nueva
        </h1>
      </div>
      <div class="w-full h-full bg-gray-100 rounded-lg p-6 flex flex-col">
        <div class="flex flex-col gap-1.5">
          <h3 class="text-lg text-gray-700 font-semibold">Crear contraseña</h3>
          <p class="text-sm text-gray-500">Registra la nueva contraseña con </br> la que ingresarás a tu cuenta.</p>
        </div>
        <div class="flex max-w-md w-full items-center justify-center mt-10 mx-auto">
          <div class="w-full">
            <@form.kw action=url.loginAction method="post">
              <input
                autocomplete="username"
                name="username"
                type="hidden"
                value="${username}"
              >
              <input autocomplete="current-password" name="password" type="hidden">
              <@input.kw
                autocomplete="new-password"
                autofocus=true
                invalid=messagesPerField.existsError("password", "password-confirm")
                label=msg("passwordNew")
                name="password-new"
                type="password"
              />
              <ul class="text-sm text-gray-500 pl-2 list-disc list-inside">
                <li>
                  Al menos 6 caracteres
                </li>
                <li>
                  Al menos 1 letra mayúscula
                </li>
                <li>
                  Al menos 1 carácter especial (@#$%&._*)
                </li>
              </ul>
              <@input.kw
                autocomplete="new-password"
                invalid=messagesPerField.existsError("password-confirm")
                label=msg("passwordConfirm")
                message=kcSanitize(messagesPerField.get("password-confirm"))
                name="password-confirm"
                type="password"
              />
              <@buttonGroup.kw>
                  <@button.kw color="blue" type="submit">
                    ${msg("Guardar contraseña")}
                  </@button.kw>
              </@buttonGroup.kw>
            </@form.kw>
          </div>
        </div>
      </div>
    </body>
  </html>


